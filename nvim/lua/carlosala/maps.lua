local map = vim.keymap.set
local silent = { silent = true }

-- basic
map("n", "<Leader>w", ":w<CR>", silent)
map("n", "<Leader>q", vim.cmd.q, silent)
map("n", "Q", "<Nop>", silent)
map("n", "<Space>", "<Nop>", silent)

map("v", "J", ":m '>+1<CR>gv=gv", silent)
map("v", "K", ":m '<-2<CR>gv=gv", silent)

map({ "n", "v" }, "j", "gj", silent)
map({ "n", "v" }, "gj", "j", silent)
map({ "n", "v" }, "k", "gk", silent)
map({ "n", "v" }, "gk", "k", silent)

map("n", "<Leader>ss", "<C-w>v", silent)
map("n", "<Leader>sv", "<C-w>s", silent)
map({ "n", "v" }, "<M-j>", "<C-d>zz", silent)
map({ "n", "v" }, "<M-k>", "<C-u>zz", silent)
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
map("n", "<Leader>u", vim.cmd.UndotreeToggle, silent)
map({ "n", "v" }, "<Leader>b", ":Neoformat<CR>", silent)
map("n", "<Leader>vd", ":Gvdiffsplit!<CR>", silent)

-- telescope
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", silent)
map("n", "<Leader>fg", "<Cmd>Telescope git_files<CR>", silent)
map("n", "<Leader>fs", '<Cmd>Telescope grep_string search=""<CR>', silent)
map("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", silent)
map("n", "<Leader>fo", "<Cmd>Telescope buffers<CR>", silent)
