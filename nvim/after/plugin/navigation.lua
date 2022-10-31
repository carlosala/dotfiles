-- telescope.nvim
local telescope = require("telescope")
telescope.setup({
  pickers = {
    find_files = {
      find_command = { "fd", "-t=f", "-i", "-H", "-E", ".git", "-c=never", "--strip-cwd-prefix" },
    },
    grep_string = {
      additional_args = function()
        return { "-i", "--hidden", "-g", "!.git", "-g", "!.yarn", "-g", "!*lock" }
      end,
      disable_coordinates = true,
    },
  },
})
telescope.load_extension("fzf")

-- nvim-tree.lua
require("nvim-tree").setup({
  actions = { open_file = { quit_on_open = true } },
  git = { ignore = false },
})
