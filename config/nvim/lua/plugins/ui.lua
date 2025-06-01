local icons = require("config.icons")

return {
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "meuter/lualine-so-fancy.nvim",
      { "letieu/harpoon-lualine", version = "*" },
    },
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    config = function()
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
  },
  -- ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = false,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "#151819",
            background = "#151819",
          },
        },
        highlights = {
          FloatBorder = {
            -- guifg = colors.subtext1,
          },
        },
      })
    end,
  },
  -- Barbequeue breadcrumbs
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      delay = 300,
      icons = {
        rules = false,
        breadcrumb = icons.ui.DoubleChevronRight .. " ", -- symbol used in the command line area that shows your active key combo
        separator = icons.ui.BoldArrowRight .. " ",      -- symbol used between a key and it's label
        group = icons.ui.Package .. " ",                 -- symbol prepended to a group
      },
      plugins = {
        spelling = {
          enabled = false,
        },
      },
      win = {
        height = {
          max = math.huge,
        },
      },
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>f", group = "Find" },
          { "<leader>g", group = "Git" },
          { "<leader>l", group = "LSP" },
          { "<leader>u", group = "Toggle Features" },
          { "<leader>W", group = "Workspace" },
          { "<leader>h", group = "Harpoon" },
          { "[",         group = "prev" },
          { "]",         group = "next" },
          { "g",         group = "goto" },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
