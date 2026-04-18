local override_highlights = function()
  vim.cmd("highlight Pmenu guibg=none")
  vim.cmd("highlight PmenuExtra guibg=none")
  vim.cmd("highlight FloatBorder guibg=none")
  vim.cmd("highlight NormalFloat guibg=none")
end

local accent_by_theme = {
  ["gruvbox-material"] = "#F18634",
  ["ember-auto"] = { dark = "#E08060", light = "#b84c30" },
  ["kanagawa"] = "#7E9CD8",
  ["kanagawa-paper"] = "#7E9CD8",
}

local resolve_accent = function(entry)
  if type(entry) == "table" then
    return entry[vim.o.background] or entry.dark or entry.light
  end
  return entry
end

local apply_accent = function()
  local accent = resolve_accent(accent_by_theme[vim.g.colors_name]) or "#F18634"
  local groups = {
    "FloatBorder",
    "BlinkCmpMenuBorder",
    "BlinkCmpDocBorder",
    "BlinkCmpSignatureHelpBorder",
    "SnacksPickerBorder",
    "SnacksPickerPreviewBorder",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none", fg = accent })
  end
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = accent, bold = true })
end

-- Set an autocommand to re-apply background overrides when colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    override_highlights()
    apply_accent()

    if vim.g.colors_name == "gruvbox-material" then
      local config = vim.fn["gruvbox_material#get_configuration"]()
      local palette = vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config
        .colors_override)
      local set_hl = vim.fn["gruvbox_material#highlight"]
      if vim.o.background == "dark" then
        -- Darker background
        set_hl("Normal", palette.fg0, palette.bg_dim)
        set_hl("NormalNC", palette.fg0, { "#161616", 255 })
      else
        -- Lighter background
        set_hl("Normal", palette.fg0, { "#F9F5D7", 255 })
        set_hl("NormalNC", palette.fg0, { "#f7f2cb", 255 })
      end
    end
  end,
})

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
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.g.gruvbox_material_cursor = "auto"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_dim_inactive_windows = 1
      vim.g.gruvbox_material_better_performance = 1

      -- Diagnostic virtual text
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { bg = "none", fg = "#B0B846" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none", fg = "#80AA9D" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none", fg = "#D3869B" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none", fg = "#E9B144" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none", fg = "#F2584B" })

      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
      })

      -- vim.cmd.colorscheme("kanagawa")
    end
  },
  {
    "ember-theme/nvim",
    name = "ember",
    priority = 1000,
    config = function()
      require("ember").setup({
        variant = "ember-auto",
      })
      vim.cmd("colorscheme ember-auto")
    end,
  }
}
