vim.g.mapleader = " "
vim.g.maplocalleader = " l"

local map = vim.keymap.set
local silent = { silent = true }

-- basic
map("n", "<Leader>w", ":w<CR>", silent)
map("n", "<Leader>W", ":noa w<CR>", silent)
map("n", "<Leader>q", ":q<CR>", silent)
map("n", "Q", "<Nop>", silent)

map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

map("n", "<Leader>ss", "<C-w>v", silent)
map("n", "<Leader>sv", "<C-w>s", silent)
map("n", "<M-j>", "10<C-e>", silent)
map("n", "<M-k>", "10<C-y>", silent)
map("n", "<M-d>", "<C-d>zz", silent)
map("n", "<M-u>", "<C-u>zz", silent)

map("n", "<Leader>o", ":noh<CR>", silent)
map("n", "x", '"_x', silent)
map({ "n", "v" }, "<Leader>c", '"_c', silent)
map({ "n", "v" }, "<Leader>d", '"_d', silent)
map("v", "<Leader>p", '"_dP', silent)

-- lsp
map("n", "<Leader>e", vim.diagnostic.open_float, silent)
map("n", "[d", vim.diagnostic.goto_prev, silent)
map("n", "]d", vim.diagnostic.goto_next, silent)

-- plugins
map("n", "<Leader>n", ":NvimTreeFindFile<CR>", silent)

map({ "n", "v" }, "<Leader>b", ":Neoformat<CR>")

map("n", "<Leader>f", ":Telescope find_files<CR>", silent)
map("n", "<Leader>g", ':Telescope grep_string search=""<CR>', silent)
map("n", "<Leader>h", ":Telescope help_tags<CR>", silent)
map("n", "<Leader>t", ":Telescope treesitter<CR>", silent)

map("n", "<Leader>vb", require("gitsigns").blame_line, silent)
map("n", "<Leader>vd", ":Gvdiffsplit!<CR>", silent)
map({ "n", "v" }, "<Leader>vgg", ":diffget<CR>", silent)
map({ "n", "v" }, "<Leader>vg2", ":diffget //2<CR>", silent)
map({ "n", "v" }, "<Leader>vg3", ":diffget //3<CR>", silent)
