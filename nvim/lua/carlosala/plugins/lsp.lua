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
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = { exclude = { "clangd", "r_language_server" } },
      })
      require("mason-tool-installer").setup({
        ensure_installed = { "luacheck", "prettier", "stylua", "taplo" },
      })
      require("mason-tool-installer").check_install(false) -- false stands for not updating, only installing

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        update_in_insert = false,
        signs = { text = require("carlosala.icons").diagnostics },
      })

      local default_capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      --- @class (partial) Config.P: vim.lsp.Config
      --- @param  custom_config? Config.P
      --- @param custom_on_attach? vim.lsp.client.on_attach_cb
      --- @return vim.lsp.Config
      local function config(custom_config, custom_on_attach)
        return vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(default_capabilities),
          --- @type vim.lsp.client.on_attach_cb
          on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            local map = vim.keymap.set
            map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", bufopts)
            map("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", bufopts)
            map("n", "gy", "<Cmd>Telescope lsp_type_definitions<CR>", bufopts)
            map("n", "gr", "<Cmd>Telescope lsp_references<CR>", bufopts)
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
          return table.concat({ vim.env.VIRTUAL_ENV, "bin", "python" }, "/")
        end

        -- find venv in current dir
        for _, pattern in ipairs({ "*", ".*" }) do
          local match = vim.fn.glob(table.concat({ root_dir, pattern, "pyvenv.cfg" }, "/"))
          if match ~= "" then
            return table.concat({ vim.fs.dirname(match), "bin", "python" }, "/")
          end
        end

        -- fallback to system installation
        return nil
      end

      --- require("rustaceanvim")
      ---@type rustaceanvim.Opts
      vim.g.rustaceanvim = {
        server = {
          on_attach = config().on_attach,
          default_settings = {
            ["rust-analyzer"] = {
              cachePriming = { numThreads = tonumber(vim.env.CARGO_BUILD_JOBS) },
              rust = { analyzerTargetDir = "target/nvim-rust-analyzer" },
              server = {
                extraEnv = {
                  CHALK_OVERFLOW_DEPTH = "100000000",
                  CHALK_SOLVER_MAX_SIZE = "100000000",
                },
              },
              cargo = {
                extraEnv = {
                  CARGO_BUILD_JOBS = vim.env.CARGO_BUILD_JOBS,
                  SKIP_WASM_BUILD = "1",
                },
                features = "all",
              },
              numThreads = tonumber(vim.env.CARGO_BUILD_JOBS),
              procMacro = {
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                  ["async-std"] = { "async_std" },
                },
              },
            },
          },
        },
      }

      local function lsp_enable(server, conf)
        vim.lsp.config(server, conf)
        vim.lsp.enable(server)
      end

      lsp_enable("eslint", config())
      lsp_enable("lua_ls", config())
      lsp_enable("r_language_server", config())
      lsp_enable("ruff", config())
      lsp_enable("ts_ls", config())

      lsp_enable(
        "clangd",
        config(nil, function(_, bufnr)
          vim.keymap.set(
            "n",
            "<LocalLeader>ls",
            "<Cmd>ClangdSwitchSourceHeader<CR>",
            { noremap = true, silent = true, buffer = bufnr }
          )
        end)
      )
      lsp_enable(
        "jsonls",
        config({
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })
      )
      lsp_enable(
        "pyright",
        config({
          before_init = function(_, conf)
            conf.settings.python.pythonPath = get_python_path(conf.root_dir)
          end,
        })
      )
      lsp_enable(
        "texlab",
        config({
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
        end)
      )
      lsp_enable(
        "yamlls",
        config({
          settings = {
            yaml = {
              schemaStore = { enable = false, url = "" },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        })
      )
    end,
  },
}
