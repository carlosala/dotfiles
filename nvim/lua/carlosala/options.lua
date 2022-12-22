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
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.mousetime = 0
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 6

vim.g.mapleader = " "

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.tex_flavor = "latex"
vim.g["&t_ut"] = "" -- fix for kitty, see https://sw.kovidgoyal.net/kitty/faq
