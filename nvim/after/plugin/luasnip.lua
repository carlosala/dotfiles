local ls = require("luasnip")
local node_util = require("luasnip.nodes.util")
local map = vim.keymap.set

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })

map({ "i", "v" }, "<M-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map({ "i", "v" }, "<M-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

ls.setup({
  enable_autosnippets = true,
  history = true,
  update_events = "TextChanged,TextChangedI",
  parser_nested_assembler = function(_, snippet)
    local select = function(snip, no_move)
      snip.parent:enter_node(snip.indx)
      -- upon deletion, extmarks of inner nodes should shift to end of
      -- placeholder-text.
      for _, node in ipairs(snip.nodes) do
        node:set_mark_rgrav(true, true)
      end

      -- SELECT all text inside the snippet.
      if not no_move then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        node_util.select_node(snip)
      end
    end
    function snippet:jump_into(dir, no_move)
      if self.active then
        -- inside snippet, but not selected.
        if dir == 1 then
          self:input_leave()
          return self.next:jump_into(dir, no_move)
        else
          select(self, no_move)
          return self
        end
      else
        -- jumping in from outside snippet.
        self:input_enter()
        if dir == 1 then
          select(self, no_move)
          return self
        else
          return self.inner_last:jump_into(dir, no_move)
        end
      end
    end
    -- this is called only if the snippet is currently selected.
    function snippet:jump_from(dir, no_move)
      if dir == 1 then
        return self.inner_first:jump_into(dir, no_move)
      else
        self:input_leave()
        return self.prev:jump_into(dir, no_move)
      end
    end
    return snippet
  end,
})
require("luasnip.loaders.from_snipmate").lazy_load()
