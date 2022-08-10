vim.cmd([[
if empty(glob(stdpath("data") . "/site/autoload/plug.vim"))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
]])
