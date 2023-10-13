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
          toml = { require("formatter.filetypes.toml").taplo },
          typescript = { require("formatter.filetypes.typescript").prettier },
          vue = { require("formatter.filetypes.vue").prettier },
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
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require("lint").linters_by_ft = {
        c = { "clangtidy" },
        cpp = { "clangtidy" },
        lua = { "luacheck" },
        markdown = { "vale" },
        python = { "pylint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
