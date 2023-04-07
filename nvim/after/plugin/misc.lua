-- nvim-texlabconfig
require("texlabconfig").setup()

-- peek.nvim
require("peek").setup({ app = "chromium" })
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
