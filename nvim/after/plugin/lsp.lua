local lsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
  return vim.tbl_deep_extend("force", {
    --- @diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
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
  texlab = {
    chktex = { onEdit = true, onOpenAndSave = true },
    build = { forwardSearchAfter = true },
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
