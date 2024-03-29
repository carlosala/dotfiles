---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        pickers = {
          find_files = { hidden = true },
          grep_string = { disable_coordinates = true },
        },
        extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
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
        group = vim.api.nvim_create_augroup("carlosala-nvimtree", { clear = true }),
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
