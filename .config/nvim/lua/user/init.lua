-- Load in the headers
local headers = require("user.headers")
math.randomseed(os.time())

--  ▄████████  ▄██████▄  ███▄▄▄▄      ▄████████  ▄█     ▄██████▄
-- ███    ███ ███    ███ ███▀▀▀██▄   ███    ███ ███    ███    ███
-- ███    █▀  ███    ███ ███   ███   ███    █▀  ███▌   ███    █▀
-- ███        ███    ███ ███   ███  ▄███▄▄▄     ███▌  ▄███
-- ███        ███    ███ ███   ███ ▀▀███▀▀▀     ███▌ ▀▀███ ████▄
-- ███    █▄  ███    ███ ███   ███   ███        ███    ███    ███
-- ███    ███ ███    ███ ███   ███   ███        ███    ███    ███
-- ████████▀   ▀██████▀   ▀█   █▀    ███        █▀     ████████▀
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    -- TEMP: Use `v3` branch
    branch = "v3", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "solidity",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },

    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the LSP setup handler function based on server name
    -- setup_handlers = {
    --   -- first function changes the default setup handler
    --   function(server, opts) require("lspconfig")[server].setup(opts) end,
    --   -- keys for a specific server name will be used for that LSP
    --   sumneko_lua = function(server, opts)
    --     -- custom sumneko_lua setup handler
    --     require("lspconfig")["sumneko_lua"].setup(opts)
    --   end,
    -- },

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
      -- example for addings schemas to yamlls
      yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
        settings = {
          yaml = {
            schemas = {
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            },
          },
        },
      },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- tables with the `name` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      ["<leader>b"] = { name = "Buffers" },

      -- Obsidian
      ["<leader>o"] = { name = "Obsidian" },
      ["<leader>ot"] = { "<cmd>ObsidianToday<cr>", desc = "Open today's note" },
      ["<leader>of"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Search through Obsidian files" },
      ["<leader>os"] = { "<cmd>ObsidianSearch<cr>", desc = "Search through note contents" },
      ["<leader>ol"] = { "<cmd>ObsidianFollowLink<cr>", desc = "Follow link" },
      ["<leader>oo"] = { "<cmd>ObsidianOpen<cr>", desc = "Open file in Obsidian" },

      -- ToggleTerm bindings
      ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
      },
    },
  },

  -- Configure plugins
  plugins = {
    -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
    {
      "folke/which-key.nvim",
      lazy = false,
      config = function(plugin, opts)
        plugin.default_config(opts)
        -- Add bindings which show up as group name
        local wk = require "which-key"
        wk.register({
          o = { name = "Obsidian" },
        }, { mode = "n", prefix = "<leader>" })
      end,
    },

    -- Disable nvim-dap
    { "mfussenegger/nvim-dap", enabled = false },
    { "jay-babu/mason-nvim-dap.nvim", enabled = false },
    { "rcarriga/nvim-dap-ui", enabled = false },

    -- Alpha Dashboard Headers
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        -- customize the dashboard header
        opts.section.header.val = headers[math.random(#headers)]
        return opts
      end,
    },

    -- ToggleTerm Mapping
    {
      "akinsho/toggleterm.nvim",
      opts = {
        open_mapping = [[<C-\>]],
      }
    },

    -- NeoTree Position Config
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        window = {
          position = "right",
        }
      }
    },

    -- Catppuccin
    {
      "catppuccin/nvim",
      lazy = false,
      opt = false,
      as = "catppuccin",
      config = function()
        -- latte, frappe, macchiato, mocha
        vim.g.catppuccin_flavour = "mocha"
        -- local colors = require("catppuccin.palettes").get_palette()
        require("catppuccin").setup {
          transparent_background = true,
          term_colors = true,
          styles = {
            comments = { "italic" },
            functions = { "italic", "bold" },
            keywords = { "italic" },
          },
        }
      end,
    },

    -- lsp_lines (more in-depth diagnostics)
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      lazy = false,
      after = "mason-lspconfig.nvim",
      module = "lsp_lines",
      config = function() require("lsp_lines").setup() end,
    },

    -- noice (cmd bar, notify, etc.)
    {
      "folke/noice.nvim",
      after = "nui.nvim",
      event = "VimEnter",
      config = function()
        require("noice").setup {
          notify = {
            -- Noice can be used as `vim.notify` so you can route any notification like other messages
            -- Notification messages have their level and other properties set.
            -- event is always "notify" and kind can be any log level as a string
            -- The default routes will forward notifications to nvim-notify
            -- Benefit of using Noice for this is the routing and consistent history view
            enabled = false,
          },
          messages = {
            enabled = false,
          },
          lsp = {
            hover = {
              enabled = false,
            },

            signature = {
              enabled = false,
            },
          }
        }
      end,
    },

    -- Leap
    {
      "ggandor/leap.nvim",
      lazy = false,
      config = function()
        local leap = require "leap"
        leap.setup {
          highlight_unlabeled_phase_one_targets = false,
        }
        leap.add_default_mappings()
      end,
    },

    -- Obsidian
    {
      "epwalsh/obsidian.nvim",
      lazy = false,
      as = "obsidian",
      config = function()
        require("obsidian").setup {
          dir = "/Users/ben/obsidian/obsidian",
          completion = {
            nvim_cmp = true,
          }
        }
      end
    },

    -- Lua copilot
    {
      "zbirenbaum/copilot.lua",
      lazy = false,
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require("copilot").setup({
            panel = {
              enabled = true,
              auto_refresh = true,
              ---@type table<'accept'|'next'|'prev'|'dismiss', false|string>
              keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
              },
            },
            suggestion = {
              enabled = true,
              auto_trigger = true,
              debounce = 50,
              keymap = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
              },
            },
          })
        end, 100)
      end,
    },
  },

  -- Customize Heirline options
  -- heirline = {
  --   -- Customize different separators between sections
  --   separators = {
  --     breadcrumbs = " > ",
  --     tab = { "", "" },
  --   },
  --   -- Customize colors for each element each element has a `_fg` and a `_bg`
  --   colors = function(colors)
  --     colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
  --     return colors
  --   end,
  --   -- Customize attributes of highlighting in Heirline components
  --   attributes = {
  --     -- styling choices for each heirline element, check possible attributes with `:h attr-list`
  --     git_branch = { bold = true }, -- bold the git branch statusline component
  --   },
  --   -- Customize if icons should be highlighted
  --   icon_highlights = {
  --     breadcrumbs = false, -- LSP symbols in the breadcrumbs
  --     file_icon = {
  --       winbar = false, -- Filetype icon in the winbar inactive windows
  --       statusline = true, -- Filetype icon in the statusline
  --       tabline = true, -- Filetype icon in the tabline
  --     },
  --   },
  -- },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Toggle LSP Lines
    vim.keymap.set("", "<Leader>1", function()
      require("lsp_lines").toggle()
      local virtual_lines_enabled = vim.diagnostic.config().virtual_lines
      vim.diagnostic.config { virtual_text = not virtual_lines_enabled }
    end, { desc = "Toggle lsp_lines" })

    -- Grep in file
    vim.keymap.set(
      "",
      "<Leader>fv",
      function() require("telescope.builtin").live_grep { search_dirs = { vim.fn.expand "%:p" } } end,
      { desc = "Search words in file" }
    )

    -- Remap Ctrl+D / Ctrl+U to center the screen
    vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

    -- Copilot
    vim.keymap.set("i", "<M-tab>", function()
      require("copilot.suggestion").accept()
    end, {
      desc = "[copilot] accept suggestion",
      silent = true,
    })

    -- Set up notify background color
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}

return config
