local override_highlights = function()
  vim.cmd('highlight Pmenu guibg=none')
  vim.cmd('highlight PmenuExtra guibg=none')
  vim.cmd('highlight FloatBorder guibg=none')
  vim.cmd('highlight NormalFloat guibg=none')
end

return {
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
      vim.g.gruvbox_material_cursor = "auto"

      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_dim_inactive_windows = 1

      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")

      -- Float borders
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#F18634" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "none", fg = "#F18634" })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "none", fg = "#F18634" })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { bg = "none", fg = "#F18634" })
      vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none", fg = "#F18634" })
      vim.api.nvim_set_hl(0, "SnacksPickerPreviewBorder", { bg = "none", fg = "#F18634" })

      override_highlights()
    end,
  },
  {
    "darianmorat/gruvdark.nvim",
    enabled = false,
    config = function()
      -- vim.cmd.colorscheme("gruvdark")

      override_highlights()
    end
  },
  {
    "Koalhack/darcubox-nvim",
    enabled = false,
    config = function()
      -- vim.cmd("colorscheme darcubox")

      override_highlights()
    end
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    config = function()
      -- vim.cmd("colorscheme kanagawa-dragon")

      override_highlights()
    end,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    enabled = true,
    config = function()
      -- vim.cmd("colorscheme kanagawa-paper-ink")

      override_highlights()
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    config = function()
      -- vim.cmd("colorscheme catppuccin")

      override_highlights()
    end,
  },
  {
    "gthelding/monokai-pro.nvim",
    enabled = false,
    config = function()
      require("monokai-pro").setup({
        filter = "ristretto",
        override = function()
          return {
            NonText = { fg = "#948a8b" },
          }
        end,
      })

      -- vim.cmd([[colorscheme monokai-pro]])

      override_highlights()
    end,
  },
}
