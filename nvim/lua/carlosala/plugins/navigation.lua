return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        pickers = {
          find_files = {
            find_command = { "fd", "-t=f", "-i", "-H", "-E", ".git", "-c=never", "--strip-cwd-prefix" },
          },
          grep_string = {
            additional_args = { "-i", "--hidden", "-g", "!.git", "-g", "!.yarn", "-g", "!*lock" },
            disable_coordinates = true,
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        actions = { open_file = { quit_on_open = true } },
        git = { ignore = false },
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
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = true,
  },
  {
    "knubie/vim-kitty-navigator",
    build = "cp *.py ~/.config/kitty",
    event = "VeryLazy",
  },
}
