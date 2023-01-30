-- telescope.nvim
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

-- nvim-tree.lua
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

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- cd to the directory
    vim.cmd.cd(data.file)

    -- open the tree in the current buffer
    require("nvim-tree.api").tree.open({ current_window = true })
  end,
})
