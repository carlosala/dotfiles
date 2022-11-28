local cmp = require("cmp")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
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
    { name = "nvim_lsp_signature_help" },
  }, {
    { name = "path", option = { trailing_slash = true } },
  }, {
    { name = "buffer" },
  }),
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping(function()
      if cmp.visible() then
        return cmp.abort()
      else
        cmp.complete()
      end
    end),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.confirm({ select = true })
      else
        fallback()
      end
    end),
    ["<Tab>"] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ["<S-Tab>"] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  }),
})

-- add () after function completion
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
