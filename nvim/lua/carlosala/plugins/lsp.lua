return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "onsails/lspkind.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "simrat39/rust-tools.nvim",
      "b0o/schemastore.nvim",
      "jose-elias-alvarez/typescript.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = { exclude = { "clangd", "r_language_server" } },
      })

      require("neodev").setup({
        override = function(_, library)
          library.enabled = true
          library.plugins = true
        end,
      })

      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function config(_config)
        return vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            local map = vim.keymap.set
            local tb = require("telescope.builtin")
            map("n", "gd", vim.lsp.buf.definition, bufopts)
            map("n", "gi", vim.lsp.buf.implementation, bufopts)
            map("n", "gy", vim.lsp.buf.type_definition, bufopts)
            map("n", "gr", tb.lsp_references, bufopts)
            map("n", "K", vim.lsp.buf.hover, bufopts)
            map("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            map("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
            map("n", "<Leader>ca", function()
              vim.lsp.buf.code_action({ apply = true })
            end, bufopts)
            map("n", "<Leader>sd", tb.lsp_document_symbols, bufopts)
            map("n", "<Leader>sw", tb.lsp_workspace_symbols, bufopts)
            if client.name == "texlab" then
              vim.keymap.set("n", "<Leader>lb", ":w<CR>:TexlabBuild<CR>", bufopts)
              vim.keymap.set("n", "<Leader>lc", ":w<CR>:TexWordCount<CR>", bufopts)
            end
            if client.name == "clangd" then
              vim.keymap.set("n", "<Leader>ls", ":ClangdSwitchSourceHeader<CR>", bufopts)
            end
          end,
        }, _config or {})
      end

      require("rust-tools").setup({ server = config() })
      require("typescript").setup({ server = config() })

      lsp.clangd.setup(config())
      lsp.eslint.setup(config())
      lsp.lua_ls.setup(config())
      lsp.pyright.setup(config())
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
      lsp.texlab.setup(config({
        settings = {
          texlab = {
            build = {
              args = { "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
              executable = "tectonic",
              forwardSearchAfter = true,
            },
            chktex = { onEdit = true, onOpenAndSave = true },
            forwardSearch = {
              args = {
                "--synctex-editor-command",
                "nvim-texlabconfig -file '%{input}' -line %{line}",
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
