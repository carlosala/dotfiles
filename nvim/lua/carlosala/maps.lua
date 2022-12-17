local map = vim.keymap.set
local silent = { silent = true }

-- basic
map("n", "<Leader>w", ":w<CR>", silent)
map("n", "<Leader>q", ":q<CR>", silent)
map("n", "Q", "<Nop>", silent)
map("n", "<Space>", "<Nop>", silent)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

map("n", "<Leader>ss", "<C-w>v", silent)
map("n", "<Leader>sv", "<C-w>s", silent)
map({ "n", "v" }, "<M-d>", "<C-d>zz", silent)
map({ "n", "v" }, "<M-u>", "<C-u>zz", silent)
map("n", "n", "nzz")
map("n", "N", "Nzz")

map({ "n", "v" }, "<Leader>y", '"+y', silent)
map("n", "x", '"_x', silent)
map("v", "<Leader>x", '"_x', silent)
map({ "n", "v" }, "<Leader>c", '"_c', silent)
map({ "n", "v" }, "<Leader>d", '"_d', silent)
map("v", "<Leader>p", '"_dP', silent)

-- diagnostic
map("n", "<Leader>e", vim.diagnostic.open_float, silent)
map("n", "[d", vim.diagnostic.goto_prev, silent)
map("n", "]d", vim.diagnostic.goto_next, silent)

-- plugins
map("n", "<Leader>n", vim.cmd.NvimTreeFindFile, silent)
map({ "n", "v" }, "<Leader>b", vim.cmd.Neoformat)

-- telescope
local tb = require("telescope.builtin")
map("n", "<Leader>ff", tb.find_files, silent)
map("n", "<Leader>fg", tb.git_files, silent)
map("n", "<Leader>g", ':Telescope grep_string search=""<CR>', silent)
map("n", "<Leader>h", tb.help_tags, silent)

-- git
map("n", "<Leader>vd", ":Gvdiffsplit!<CR>", silent)
map({ "n", "v" }, "<Leader>vgg", ":diffget<CR>", silent)
map({ "n", "v" }, "<Leader>vg2", ":diffget //2<CR>", silent)
map({ "n", "v" }, "<Leader>vg3", ":diffget //3<CR>", silent)
