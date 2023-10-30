return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      { "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        preselect = "None",
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "git" },
          { name = "path" },
          { name = "calc" },
          { name = "emoji" },
          { name = "buffer" },
          { name = "nvim_lsp_signature_help" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.abort()
            else
              cmp.complete()
            end
          end),
          ["<CR>"] = cmp.mapping.confirm(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
      })

      -- start required for cmp_git
      require("cmp_git").setup()

      -- add () after function completion
      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
}
