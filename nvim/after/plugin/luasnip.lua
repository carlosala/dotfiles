local ls = require("luasnip")
local map = vim.keymap.set

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })

ls.setup({
  enable_autosnippets = true,
  history = true,
  update_events = "TextChanged,TextChangedI",
})
require("luasnip.loaders.from_snipmate").lazy_load()

map("i", "<M-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map("i", "<M-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
