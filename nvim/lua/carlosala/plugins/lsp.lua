return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    dependencies = {
      "onsails/lspkind.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "whoissethdaniel/mason-tool-installer.nvim",
      "folke/neodev.nvim",
      "simrat39/rust-tools.nvim",
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
        ensure_installed = { "black", "luacheck", "stylua", "taplo" },
      })
      require("mason-tool-installer").check_install(false) -- false stands for not updating, only installing

      require("neodev").setup({
        override = function(_, library)
          library.enabled = true
          library.plugins = true
        end,
      })

      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function config(custom_config)
        return vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            local map = vim.keymap.set
            map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", bufopts)
            map("n", "gD", vim.lsp.buf.declaration, bufopts)
            map("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", bufopts)
            map("n", "gy", "<Cmd>Telescope lsp_type_definitions<CR>", bufopts)
            map("n", "gr", "<Cmd>Telescope lsp_references<CR>", bufopts)
            map("n", "K", vim.lsp.buf.hover, bufopts)
            map("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            map("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
            map("n", "<Leader>ca", function()
              vim.lsp.buf.code_action({ apply = true })
            end, bufopts)
            map("n", "<Leader>sd", "<Cmd>Telescope lsp_document_symbols<CR>", bufopts)
            map("n", "<Leader>sw", "<Cmd>Telescope lsp_workspace_symbols<CR>", bufopts)
            if client.name == "texlab" then
              map("n", "<LocalLeader>b", "<Cmd>w<CR><Cmd>TexlabBuild<CR>", bufopts)
              map("n", "<LocalLeader>c", "<Cmd>w<CR><Cmd>TexWordCount<CR>", bufopts)
            end
            if client.name == "clangd" then
              map("n", "<LocalLeader>s", "<Cmd>ClangdSwitchSourceHeader<CR>", bufopts)
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

      require("rust-tools").setup({ server = config() })
      require("typescript-tools").setup(config())

      lsp.clangd.setup(config())
      lsp.eslint.setup(config())
      lsp.lua_ls.setup(config())
      lsp.r_language_server.setup(config())
      lsp.vimls.setup(config())
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
        settings = {
          texlab = {
            build = { forwardSearchAfter = true },
            chktex = { onEdit = true, onOpenAndSave = true },
            forwardSearch = {
              args = {
                "--synctex-editor-command",
                require("texlabconfig").project_dir()
                  .. "/nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server "
                  .. vim.v.servername,
                "--synctex-forward",
                "%l:1:%f",
                "%p",
              },
              executable = "zathura",
            },
          },
        },
      }))
      lsp.yamlls.setup(config({
        settings = {
          yaml = {
            keyOrdering = false,
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      }))
    end,
  },
}
