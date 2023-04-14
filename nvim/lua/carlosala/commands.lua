local function _word_count()
  if vim.bo.filetype ~= "tex" then
    return
  end
  local _fn = vim.fn.expand("%")
  local _count = vim.fn.system("texcount " .. _fn .. " -inc -incbib -sum -1")
  vim.cmd.echo(_count)
end

vim.api.nvim_create_user_command("TexWordCount", _word_count, {})

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
