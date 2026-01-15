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
      require("nvim-treesitter").install(ensure_installed)

      local ignored_langs = { latex = true }
      local all_langs = {}

      for k in pairs(require("nvim-treesitter.parsers")) do
        all_langs[k] = true
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", {}),
        callback = function()
          local ft = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
          if not all_langs[ft] or ignored_langs[ft] then
            return
          end
          require("nvim-treesitter").install(ft):await(function()
            if pcall(vim.treesitter.start) then
              vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
              -- this means we are in `vim-fugitive` situation
              if vim.wo[0][0].foldmethod == "diff" then
                return
              end
              vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
              vim.wo[0][0].foldmethod = "expr"
              vim.wo[0][0].foldenable = false
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
