return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
    { "letieu/harpoon-lualine", version = "*" },
  },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local icons = require("config.icons")

    require("lualine").setup({
      options = {
        theme = "gruvbox-material",
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = icons.ui.VerticalDivider, right = icons.ui.VerticalDivider },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "alfa-nvim",
            "help",
            "Trouble",
            "spectre_panel",
            "toggleterm",
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {
          "fancy_mode",
        },
        lualine_b = {
          "fancy_branch",
          "fancy_diff",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 2 for full path
            symbols = {
              modified = icons.ui.FileModified,
              readonly = icons.ui.Lock,
              unnamed = icons.ui.CircleEmpty
            },
          },
          {
            "fancy_diagnostics",
            sources = { "nvim_lsp" },
            symbols = {
              error = icons.diagnostics.BoldError .. ' ',
              warn = icons.diagnostics.BoldWarning .. ' ',
              info = icons.diagnostics.BoldInformation .. ' '
            },
          },
        },
        lualine_x = {
          "fancy_searchcount",
          "harpoon2",
        },
        lualine_y = {
          "location",
        },
        lualine_z = {
          "fancy_lsp_servers",
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        -- lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "lazy" },
    })
  end,
}
