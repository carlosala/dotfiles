---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "whoissethdaniel/mason-tool-installer.nvim",
      "mrcjkb/rustaceanvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-tool-installer").setup({
        run_on_start = false,
        ensure_installed = {
          -- lsp
          "eslint-lsp",
          "json-lsp",
          "lua-language-server",
          "pyright",
          "ruff",
          "svelte-language-server",
          "tailwindcss-language-server",
          "texlab",
          "typescript-language-server",
          "yaml-language-server",

          -- formatters
          "prettier",
          "stylua",
          "taplo",

          -- linters
          "luacheck",
        },
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

      --- @type fun(client: vim.lsp.Client, bufnr: integer)
      local function common_on_attach(_, bufnr)
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
      end

      --- @class (partial) Config.P: vim.lsp.Config
      --- @param server string
      --- @param custom_config? Config.P
      --- @param custom_on_attach? fun(client: vim.lsp.Client, bufnr: integer)
      local function lsp_enable(server, custom_config, custom_on_attach)
        local default_config = vim.lsp.config[server] or {}
        local config = vim.tbl_deep_extend("force", default_config, {
          capabilities = vim.deepcopy(default_capabilities),
          on_attach = function(client, bufnr)
            local def_on_attach = default_config.on_attach
            if def_on_attach then
              if type(def_on_attach) == "function" then
                def_on_attach = { def_on_attach }
              end
              for _, v in ipairs(def_on_attach) do
                v(client, bufnr)
              end
            end

            common_on_attach(client, bufnr)

            if custom_on_attach then
              custom_on_attach(client, bufnr)
            end
          end,
        }, custom_config or {})

        vim.lsp.config(server, config)
        vim.lsp.enable(server)
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
          on_attach = common_on_attach,
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

      lsp_enable("eslint")
      lsp_enable("lua_ls")
      lsp_enable("r_language_server")
      lsp_enable("ruff")
      lsp_enable("svelte")
      lsp_enable("tailwindcss")
      lsp_enable("ts_ls")

      lsp_enable("clangd", nil, function(_, bufnr)
        vim.keymap.set(
          "n",
          "<LocalLeader>ls",
          "<Cmd>ClangdSwitchSourceHeader<CR>",
          { noremap = true, silent = true, buffer = bufnr }
        )
      end)
      lsp_enable("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
      lsp_enable("pyright", {
        before_init = function(_, conf)
          conf.settings.python.pythonPath = get_python_path(conf.root_dir)
        end,
      })
      lsp_enable("texlab", {
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
      lsp_enable("yamlls", {
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
    end,
  },
}
