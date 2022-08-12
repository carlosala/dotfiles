vim.g.mapleader = " "

local map = vim.keymap.set
local full_opts = { expr = true, noremap = true, silent = true }

-- basic mappings
map("n", "<Leader>w", ":w<CR>", { silent = true })
map("n", "<Leader>W", ":noa w<CR>", { silent = true })
map("n", "<Leader>q", ":q<CR>", { silent = true })

map("n", "<Leader>s", "<C-w>v", { silent = true })
map("n", "<Leader>v", "<C-w>s", { silent = true })
map("n", "<Leader>t", ":tabedit .<CR>", { silent = true })
map("n", "<M-j>", "10<C-e>", { silent = true })
map("n", "<M-k>", "10<C-y>", { silent = true })

map("n", "<Leader>o", ":noh<CR>", { silent = true })
map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "<Leader>;", "A;<Esc>", { silent = true })
map("n", "Q", "<Nop>", { silent = true })

-- coc.nvim
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })

map("i", "<C-Space>", "coc#pum#visible() ? coc#pum#stop() : coc#refresh()", full_opts)
map("i", "<Tab>", "coc#pum#visible() ? coc#pum#next(1) : '<Tab>'", full_opts)
map("i", "<S-Tab>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", full_opts)
map("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-g>u<CR>'", full_opts)

map("n", "<Leader>rn", "<Plug>(coc-rename)", { silent = true })
map("n", "<Leader>rf", ":CocCommand workspace.renameCurrentFile<CR>", { silent = true })
map("n", "<Leader>lc", ":CocCommand latex.Build<CR>", { silent = true })
map("n", "<Leader>lf", ":CocCommand latex.ForwardSearch<CR>", { silent = true })

-- other
map("n", "<Leader>n", ":NvimTreeFindFile<CR>", { silent = true })
map("n", "<Leader>f", ":Telescope find_files<CR>", { silent = true })
map("n", "<Leader>g", ":Telescope grep_string search=<CR>", { silent = true })
map("n", "<Leader>h", ":Telescope help_tags<CR>", { silent = true })
map("n", "<Leader>dd", ":Gvdiffsplit!<CR>", { silent = true })
map({ "n", "v" }, "<Leader>dgg", ":diffget<CR>", { silent = true })
map({ "n", "v" }, "<Leader>dg2", ":diffget //2<CR>", { silent = true })
map({ "n", "v" }, "<Leader>dg3", ":diffget //3<CR>", { silent = true })
map("i", "<M-CR>", "v:lua.Npairs.autopairs_cr()", full_opts)
