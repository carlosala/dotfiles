return {
  {
    "j-hui/fidget.nvim",
    opts = { window = { blend = 0 } },
  },
  {
    "sainnhe/gruvbox-material",
    priority = 100,
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      use_treesitter = true,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    priority = 99,
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
      require("lualine").setup({
        extensions = { "fugitive", "man", "nvim-tree" },
        sections = {
          lualine_b = { "branch", { "diff", source = _diff_source }, "diagnostics" },
          lualine_x = { "progress" },
          lualine_y = { "filetype" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
