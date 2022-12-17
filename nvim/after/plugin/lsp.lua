require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = { exclude = { "clangd", "r_language_server" } },
})

local lsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
  return vim.tbl_deep_extend("force", {
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
      map("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
      map("n", "<Leader>sd", tb.lsp_document_symbols, bufopts)
      map("n", "<Leader>sw", tb.lsp_workspace_symbols, bufopts)
      if client.name == "texlab" then
        vim.keymap.set("n", "<Leader>lb", ":TexlabBuild<CR>", bufopts)
      end
      if client.name == "clangd" then
        vim.keymap.set("n", "<Leader>ls", ":ClangdSwitchSourceHeader<CR>", bufopts)
      end
    end,
  }, _config or {})
end

require("typescript").setup({ server = config() })

lsp.jsonls.setup(config({ capabilities = capabilities })) -- uses snippets
lsp.eslint.setup(config())
lsp.clangd.setup(config())
lsp.vimls.setup(config())
lsp.pyright.setup(config())
lsp.r_language_server.setup(config())
lsp.yamlls.setup(config())
lsp.texlab.setup(config({
  settings = {
    texlab = {
      build = { forwardSearchAfter = true },
      chktex = { onEdit = true, onOpenAndSave = true },
      forwardSearch = {
        args = { "--synctex-forward", "%l:1:%f", "%p" },
        executable = "zathura",
      },
    },
  },
}))
lsp.sumneko_lua.setup(config({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}))
