vim.g.mapleader = " "

local map = vim.keymap.set
local full_opts = { expr = true, noremap = true, silent = true }
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

map("n", "<Leader>o", ":noh<CR>", silent)
map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "<Leader>;", "A;<Esc>", silent)
map("n", "Q", "<Nop>", silent)

-- coc.nvim
map("n", "gd", "<Plug>(coc-definition)", silent)
map("n", "gy", "<Plug>(coc-type-definition)", silent)
map("n", "gi", "<Plug>(coc-implementation)", silent)
map("n", "gr", "<Plug>(coc-references)", silent)

map("i", "<C-Space>", "coc#pum#visible() ? coc#pum#stop() : coc#refresh()", full_opts)
map("i", "<Tab>", "coc#pum#visible() ? coc#pum#next(1) : '<Tab>'", full_opts)
map("i", "<S-Tab>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", full_opts)
map("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-g>u<CR>'", full_opts)

map("n", "<Leader>rn", "<Plug>(coc-rename)", silent)
map("n", "<Leader>rf", ":CocCommand workspace.renameCurrentFile<CR>", silent)
map("n", "<Leader>lc", ":CocCommand latex.Build<CR>", silent)
map("n", "<Leader>lf", ":CocCommand latex.ForwardSearch<CR>", silent)

-- other
map("n", "<Leader>n", ":NvimTreeFindFile<CR>", silent)
map("n", "<Leader>f", ":Telescope find_files<CR>", silent)
map("n", "<Leader>g", ":Telescope grep_string search=<CR>", silent)
map("n", "<Leader>h", ":Telescope help_tags<CR>", silent)
map("n", "<Leader>dd", ":Gvdiffsplit!<CR>", silent)
map({ "n", "v" }, "<Leader>dgg", ":diffget<CR>", silent)
map({ "n", "v" }, "<Leader>dg2", ":diffget //2<CR>", silent)
map({ "n", "v" }, "<Leader>dg3", ":diffget //3<CR>", silent)
map("i", "<M-CR>", "v:lua.Npairs.autopairs_cr()", full_opts)
