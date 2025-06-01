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
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"

      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")

      vim.cmd('highlight Pmenu guibg=none')
      vim.cmd('highlight PmenuExtra guibg=none')
      vim.cmd('highlight FloatBorder guibg=none')
      vim.cmd('highlight NormalFloat guibg=none')
    end,
  },
}
