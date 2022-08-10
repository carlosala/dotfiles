Npairs = require("nvim-autopairs")

Npairs.setup({
  check_ts = true,
  map_cr = false,
})

require("Comment").setup({ ignore = "^$" })
