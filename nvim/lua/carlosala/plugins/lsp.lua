---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "whoissethdaniel/mason-tool-installer.nvim",
      "mrcjkb/rustaceanvim",
      "b0o/schemastore.nvim",
      "pmizio/typescript-tools.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = { exclude = { "clangd", "r_language_server" } },
        ensure_installed = { "tsserver" },
      })
      require("mason-tool-installer").setup({
        ensure_installed = { "luacheck", "prettier", "stylua", "taplo" },
      })
      require("mason-tool-installer").check_install(false) -- false stands for not updating, only installing

      vim.diagnostic.config({
        severity_sort = true,
        update_in_insert = false,
      })
      for name, icon in pairs(require("carlosala.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      local lsp = require("lspconfig")
      local default_capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      --- @param custom_config? lspconfig.Config
      --- @param custom_on_attach? vim.lsp.client.on_attach_cb
      --- @return lspconfig.Config
      local function config(custom_config, custom_on_attach)
        return vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(default_capabilities),
          --- @type vim.lsp.client.on_attach_cb
          on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            local map = vim.keymap.set
            map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", bufopts)
            map("n", "gD", vim.lsp.buf.declaration, bufopts)
            map("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", bufopts)
            map("n", "gy", "<Cmd>Telescope lsp_type_definitions<CR>", bufopts)
            map("n", "gr", "<Cmd>Telescope lsp_references<CR>", bufopts)
            map("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            map("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
            map("n", "<Leader>ca", function()
              vim.lsp.buf.code_action({ apply = true })
            end, bufopts)
            map("n", "<Leader>sd", "<Cmd>Telescope lsp_document_symbols<CR>", bufopts)
            map("n", "<Leader>sw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", bufopts)

            if custom_on_attach then
              custom_on_attach(client, bufnr)
            end
          end,
        }, custom_config or {})
      end

      local function get_python_path(root_dir)
        -- use active venv
        if vim.env.VIRTUAL_ENV then
          return lsp.util.path.join(vim.env.VIRTUAL_ENV, "bin", "python")
        end

        -- find venv in current dir
        for _, pattern in ipairs({ "*", ".*" }) do
          local match = vim.fn.glob(lsp.util.path.join(root_dir, pattern, "pyvenv.cfg"))
          if match ~= "" then
            return lsp.util.path.join(lsp.util.path.dirname(match), "bin", "python")
          end
        end

        -- fallback to system installation
        return nil
      end

      ---@type RustaceanOpts
      vim.g.rustaceanvim = { server = { on_attach = config().on_attach } } -- rustaceanvim autostarts!
      require("typescript-tools").setup(config({
        settings = { expose_as_code_action = { "fix_all", "organize_imports" } },
      }))

      lsp.eslint.setup(config())
      lsp.lua_ls.setup(config())
      lsp.r_language_server.setup(config())
      lsp.ruff.setup(config())

      lsp.clangd.setup(config({}, function(_, bufnr)
        vim.keymap.set(
          "n",
          "<LocalLeader>ls",
          "<Cmd>ClangdSwitchSourceHeader<CR>",
          { noremap = true, silent = true, buffer = bufnr }
        )
      end))
      lsp.jsonls.setup(config({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      }))
      lsp.pyright.setup(config({
        before_init = function(_, conf)
          conf.settings.python.pythonPath = get_python_path(conf.root_dir)
        end,
      }))
      lsp.texlab.setup(config({
        settings = { texlab = { chktex = { onOpenAndSave = true } } },
      }, function(client, bufnr)
        ---@diagnostic disable-next-line: assign-type-mismatch
        client.server_capabilities.completionProvider = false -- we use `vimtex` completion!
        vim.keymap.set(
          "n",
          "<LocalLeader>lw",
          "<Cmd>w<CR><Cmd>TexWordCount<CR>",
          { noremap = true, silent = true, buffer = bufnr }
        )
      end))
      lsp.yamlls.setup(config({
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      }))
    end,
  },
}
