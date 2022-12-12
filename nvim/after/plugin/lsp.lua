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
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
      if client.name == "texlab" then
        vim.keymap.set("n", "<LocalLeader>b", ":TexlabBuild<CR>", bufopts)
      end
      if client.name == "clangd" then
        vim.keymap.set("n", "<LocalLeader>s", ":ClangdSwitchSourceHeader<CR>", bufopts)
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
