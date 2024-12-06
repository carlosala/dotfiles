---@type LazySpec
return {
  {
    "sainnhe/gruvbox-material",
    priority = 100,
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_enable_italic = 1
      vim.cmd.colorscheme("gruvbox-material")
      vim.cmd("highlight clear NvimTreeNormal")
      vim.cmd("highlight clear NvimTreeEndOfBuffer")
      vim.cmd("highlight clear NvimTreeVertSplit")
      vim.cmd("highlight clear NvimTreeCursorLine")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function _diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end
      local diagSymbols = {}
      for i, v in pairs(require("carlosala.icons").diagnostics) do
        diagSymbols[string.lower(i)] = v
      end
      require("lualine").setup({
        extensions = { "fugitive", "man", "nvim-tree" },
        sections = {
          lualine_b = {
            "branch",
            { "diff", source = _diff_source, symbols = require("carlosala.icons").git },
            { "diagnostics", symbols = diagSymbols },
          },
          lualine_x = { "selectioncount", "progress" },
          lualine_y = { "filetype" },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      routes = {
        {
          -- empty hover
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
        {
          -- formatter
          filter = { event = "notify", find = "No change necessary with" },
          opts = { skip = true },
        },
        {
          -- after saving
          filter = { event = "msg_show", find = "written" },
          opts = { skip = true },
        },
        {
          -- after yanking
          filter = { event = "msg_show", find = "yanked" },
          opts = { skip = true },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
}
