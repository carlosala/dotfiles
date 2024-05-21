---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = "TSUpdate",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      local ensure_installed = {
        "bash",
        "c",
        "jsdoc", -- it's not installed automatically when starting a js/ts file
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
      }
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = ensure_installed,
        highlight = { enable = true, disable = { "latex" } },
        ignore_install = { "latex" },
        incremental_selection = { enable = true },
        indent = { enable = true },
      })
      vim.treesitter.language.register("jsonc", "json")
      require("treesitter-context").setup({ max_lines = 10, multiline_threshold = 4 })

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
    end,
  },
}
