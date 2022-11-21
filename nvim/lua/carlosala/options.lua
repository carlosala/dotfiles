vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("A")
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.completeopt = "menu,menuone,noselect"

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.tex_flavor = "latex"
vim.g["&t_ut"] = "" -- fix for kitty, see https://sw.kovidgoyal.net/kitty/faq

vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 1
