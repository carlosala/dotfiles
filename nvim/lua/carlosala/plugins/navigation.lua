---@type LazySpec
return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        "border-fused",
        winopts = {
          backdrop = false,
          treesitter = { enabled = false },
        },
        grep = {
          multiprocess = true,
          rg_opts = "--column --line-number --no-heading --color=never --smart-case --max-columns=4096 -e",
          _headers = { "cwd" },
        },
      })
      require("fzf-lua").register_ui_select()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        actions = { open_file = { quit_on_open = true } },
        git = { ignore = false },
        view = { width = 40 },
        on_attach = function(bufnr)
          require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
          vim.keymap.del("n", "<C-k>", { buffer = bufnr })
        end,
      })

      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function(data)
          -- check if it's a directory
          if vim.fn.isdirectory(data.file) ~= 1 then
            return
          end
          vim.cmd.enew() -- create a new, empty buffer
          vim.cmd.bw(data.buf) -- wipe the directory buffer
          vim.cmd.cd(data.file) -- cd to the directory
          require("nvim-tree.api").tree.open({ current_window = true }) -- open the tree in the current buffer
        end,
        group = vim.api.nvim_create_augroup("carlosala-nvimtree", { clear = true }),
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      highlight = { pattern = [[.*<(KEYWORDS)\s*]] },
      search = { pattern = [[\b(KEYWORDS)\b]] },
    },
  },
  {
    "knubie/vim-kitty-navigator",
    build = "cp *.py ~/.config/kitty",
    event = "VeryLazy",
    init = function()
      vim.g.kitty_navigator_no_mappings = 1
      vim.g.kitty_navigator_enable_stack_layout = 1
      vim.keymap.set({ "n", "i", "v", "c" }, "<C-h>", "<Cmd>KittyNavigateLeft<CR>", { silent = true })
      vim.keymap.set({ "n", "i", "v", "c" }, "<C-j>", "<Cmd>KittyNavigateDown<CR>", { silent = true })
      vim.keymap.set({ "n", "i", "v", "c" }, "<C-k>", "<Cmd>KittyNavigateUp<CR>", { silent = true })
      vim.keymap.set({ "n", "i", "v", "c" }, "<C-l>", "<Cmd>KittyNavigateRight<CR>", { silent = true })
    end,
  },
}
