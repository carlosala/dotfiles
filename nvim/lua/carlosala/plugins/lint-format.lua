---@type LazySpec
return {
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
    event = "VeryLazy",
    config = function()
      require("formatter").setup({
        log_level = vim.log.levels.INFO,
        filetype = {
          c = { require("formatter.filetypes.c").clangformat },
          cpp = { require("formatter.filetypes.cpp").clangformat },
          css = { require("formatter.filetypes.css").prettier },
          html = { require("formatter.filetypes.html").prettier },
          javascript = { require("formatter.filetypes.javascript").prettier },
          json = { require("formatter.filetypes.json").prettier },
          jsonc = { require("formatter.filetypes.json").prettier },
          lua = { require("formatter.filetypes.lua").stylua },
          markdown = { require("formatter.filetypes.markdown").prettier },
          python = { require("formatter.filetypes.python").ruff },
          rust = { require("formatter.filetypes.rust").rustfmt },
          toml = { require("formatter.filetypes.toml").taplo },
          typescript = { require("formatter.filetypes.typescript").prettier },
          typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
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
          r = {
            function()
              return {
                exe = "R",
                args = {
                  "--slave",
                  "--no-restore",
                  "--no-save",
                  "-e 'styler::style_text(readr::read_file(file(\"stdin\")))'",
                },
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
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
        group = vim.api.nvim_create_augroup("carlosala-nvimlint", { clear = true }),
      })
    end,
  },
}
