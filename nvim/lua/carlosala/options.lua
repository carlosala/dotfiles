vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.shortmess:append("A")
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.breakindent = true
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.writebackup = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.mousetime = 0
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 6
vim.opt.cmdheight = 0
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.tex_flavor = "latex"

-- disable unused providers and file tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
