---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
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
        "query",
        "regex",
        "vim",
        "vimdoc",
      }
      local ignored_langs = { "latex" }

      require("nvim-treesitter").install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", {}),
        callback = function()
          local ft = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
          for _, v in ipairs(ignored_langs) do
            if ft == v then
              return
            end
          end
          require("nvim-treesitter").install(ft):await(function()
            if pcall(vim.treesitter.start) then
              vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
              vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end)
        end,
      })
      require("treesitter-context").setup({ max_lines = 10, multiline_threshold = 4 })

      -- register mdx
      vim.filetype.add({ extension = { mdx = "mdx" } })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
