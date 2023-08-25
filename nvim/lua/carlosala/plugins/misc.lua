return {
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
    config = function()
      require("formatter").setup({
        log_level = vim.log.levels.INFO,
        filetype = {
          c = { require("formatter.filetypes.c").clangformat },
          cpp = { require("formatter.filetypes.cpp").clangformat },
          javascript = { require("formatter.filetypes.javascript").prettier },
          json = { require("formatter.filetypes.json").prettier },
          jsonc = { require("formatter.filetypes.json").prettier },
          lua = { require("formatter.filetypes.lua").stylua },
          markdown = { require("formatter.filetypes.markdown").prettier },
          python = { require("formatter.filetypes.python").black },
          rust = { require("formatter.filetypes.rust").rustfmt },
          typescript = { require("formatter.filetypes.typescript").prettier },
          yaml = { require("formatter.filetypes.yaml").prettier },
          bib = {
            function()
              return {
                exe = "bibclean",
                stdin = true,
              }
            end,
          },
          tex = {
            function()
              return {
                exe = "latexindent",
                args = { "-g", "/dev/null", "-m", "-rv" },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },
  {
    "jalvesaq/nvim-r",
    ft = "r",
    init = function()
      vim.g.R_auto_start = 2
    end,
  },
  {
    "f3fora/nvim-texlabconfig",
    build = "go build",
    ft = "tex",
    config = true,
  },
}
