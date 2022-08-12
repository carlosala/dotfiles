local addCmd = vim.api.nvim_create_user_command

addCmd(
  "FilesCustom",
  [[call fzf#vim#files(<q-args>, fzf#vim#with_preview({ "source": "fd -t f -i -H -E .git", "options": "--info=inline" }), <bang>0)]],
  { bang = true, complete = "dir", nargs = "?" }
)

addCmd(
  "RgCustom",
  [[call fzf#vim#grep('rg -n --color=always -i --hidden -g "!*.git/*" -g "!yarn.lock" -g "!package-lock.json" -- '.shellescape(<q-args>), 1, fzf#vim#with_preview({"options": "--info=inline"}), <bang>0)]],
  { bang = true, nargs = "?" }
)
