local override_highlights = function()
  vim.cmd("highlight Pmenu guibg=none")
  vim.cmd("highlight PmenuExtra guibg=none")
  vim.cmd("highlight FloatBorder guibg=none")
  vim.cmd("highlight NormalFloat guibg=none")
end

return {
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
      vim.g.gruvbox_material_cursor = "auto"

      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 0
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

      -- Diagnostic virtual text
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { bg = "none", fg = "#B0B846" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none", fg = "#80AA9D" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none", fg = "#D3869B" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none", fg = "#E9B144" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none", fg = "#F2584B" })

      override_highlights()
    end,
  },
}
