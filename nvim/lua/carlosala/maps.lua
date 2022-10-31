vim.g.mapleader = " "

local map = vim.keymap.set
local full_opts = { expr = true, replace_keycodes = false, silent = true }
local silent = { silent = true }

-- basic mappings
map("n", "<Leader>w", ":w<CR>", silent)
map("n", "<Leader>W", ":noa w<CR>", silent)
map("n", "<Leader>q", ":q<CR>", silent)

map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

map("n", "<Leader>s", "<C-w>v", silent)
map("n", "<Leader>v", "<C-w>s", silent)
map("n", "<Leader>t", ":tabedit .<CR>", silent)
map("n", "<M-j>", "10<C-e>", silent)
map("n", "<M-k>", "10<C-y>", silent)
map("n", "<M-d>", "<C-d>zz", silent)
map("n", "<M-u>", "<C-u>zz", silent)

map("n", "<Leader>o", ":noh<CR>", silent)
map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "<Leader>;", "A;<Esc>", silent)
map("n", "Q", "<Nop>", silent)

-- other
map("n", "<Leader>n", ":NvimTreeFindFile<CR>", silent)
map("n", "<Leader>f", ":Telescope find_files<CR>", silent)
map("n", "<Leader>g", ':Telescope grep_string search=""<CR>', silent)
map("n", "<Leader>h", ":Telescope help_tags<CR>", silent)
map("n", "<Leader>dd", ":Gvdiffsplit!<CR>", silent)
map({ "n", "v" }, "<Leader>dgg", ":diffget<CR>", silent)
map({ "n", "v" }, "<Leader>dg2", ":diffget //2<CR>", silent)
map({ "n", "v" }, "<Leader>dg3", ":diffget //3<CR>", silent)
