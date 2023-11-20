-- Load in the statusline config
local statusline_config = require("user.heirline")

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
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false, -- automatically quit the current session after a successful update
	},
	-- Set colorscheme to use
	colorscheme = "catppuccin",
	-- Add highlight groups in any theme
	highlights = {
		-- The `init` table affects all themes
		-- init = {
		--
		-- }

		-- NvChad-esq Telescope Theme for Catppuccin
		catppuccin = function()
			-- Pull in the catppuccin mocha colors
			local mocha = require("catppuccin.palettes").get_palette("mocha")
			local fg, bg = mocha.text, mocha.base
			local bg_alt = mocha.mantle
			local mauve = mocha.mauve
			local green = mocha.green

			-- return a table of highlights for telescope based on colors gotten from highlight groups
			return {
				TelescopeBorder = { fg = bg_alt, bg = bg },
				TelescopeNormal = { bg = bg },
				TelescopePreviewBorder = { fg = bg, bg = bg },
				TelescopePreviewNormal = { bg = bg },
				TelescopePreviewTitle = { fg = bg, bg = mauve },
				TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
				TelescopePromptNormal = { fg = fg, bg = bg_alt },
				TelescopePromptPrefix = { fg = green, bg = bg_alt },
				TelescopePromptTitle = { fg = bg, bg = green },
				TelescopeResultsBorder = { fg = bg, bg = bg },
				TelescopeResultsNormal = { bg = bg },
				TelescopeResultsTitle = { fg = bg, bg = bg },
			}
		end,
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
		virtual_lines = false,
		virtual_text = true,
		underline = true,
	},
	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- ...
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
					"toml",
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
		setup_handlers = {
			-- first function changes the default setup handler
			-- function(server, opts)
			--   require("lspconfig")[server].setup(opts)
			-- end,
			-- -- keys for a specific server name will be used for that LSP
			-- sumneko_lua = function(server, opts)
			--   -- custom sumneko_lua setup handler
			--   require("lspconfig")["sumneko_lua"].setup(opts)
			-- end,
			rust_analyzer = function(_, opts)
				require("rust-tools").setup({ server = opts })
			end,
		},
		-- Add overrides for LSP server settings, the keys are the name of the server
		config = {
			-- example for addings schemas to yamlls
			yamlls = {
				-- override table for require("lspconfig").yamlls.setup({...})
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
			-- Rust Analyzer
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							-- features = { "optimism" },
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
			-- tables with the `name` key will be registered with which-key if it's installed
			-- this is useful for naming menus
			--
			-- Buffer mappings
			["<leader>b"] = { name = "Buffers" },
			["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
			["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			["<leader>o"] = { "<cmd>Telescope buffers<cr>", desc = "Search buffers" },
			-- ToggleTerm bindings
			["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
			-- ctrl+D / ctrl+U to scroll up and down
			["<C-d>"] = { "<C-d>zz<cr>", desc = "Scroll down" },
			["<C-u>"] = { "<C-u>zz<cr>", desc = "Scroll up" },
			-- LSP Lines toggle
			["<leader>1"] = {
				function()
					require("lsp_lines").toggle()
					local virtual_lines_enabled = vim.diagnostic.config().virtual_lines
					vim.diagnostic.config({ virtual_text = not virtual_lines_enabled })
				end,
				desc = "Toggle LSP Lines diagnostics",
			},
			-- Grep in file
			["<leader>fv"] = {
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Search words in file",
			},
			-- Rust Tools / Crates
			["<leader>r"] = { name = "Rust Tools" },
			["<leader>rt"] = { "<cmd>RustOpenCargo<cr>", desc = "Open Cargo.toml" },
			["<leader>rp"] = { "<cmd>RustParentModule<cr>", desc = "Go to parent module" },
			["<leader>re"] = { "<cmd>RustExpandMacro<cr>", desc = "Expand macro (recursively)" },
			["<leader>rr"] = { "<cmd>RustRunnables<cr>", desc = "Open Runnables" },
			["<leader>rc"] = { name = "Crate Options" },
			["<leader>rcd"] = {
				function()
					require("crates").open_documentation()
				end,
				desc = "Open Crate Docs",
			},
			["<leader>rcp"] = {
				function()
					require("crates").show_popup()
				end,
				desc = "Crate Information",
			},
			["<leader>rcf"] = {
				function()
					require("crates").show_features_popup()
				end,
				desc = "Crate Features",
			},
			["<leader>rcv"] = {
				function()
					require("crates").show_versions_popup()
				end,
				desc = "Crate Versions",
			},
			["s"] = {
				function()
					local hop = require("hop")
					local directions = require("hop.hint").HintDirection
					hop.hint_char1({ direction = directions.AFTER_CURSOR })
				end,
			},
			["S"] = {
				function()
					local hop = require("hop")
					local directions = require("hop.hint").HintDirection
					hop.hint_char1({ direction = directions.BEFORE_CURSOR })
				end,
			},
		},
		i = {
			-- Copilot: Accept suggestion
			["<M-Tab>"] = {
				function()
					require("copilot.suggestion").accept()
				end,
				desc = "[copilot] accept suggestion",
			},
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
				disabled_plugins = {
					"tohtml",
					"gzip",
					"matchit",
					"zipPlugin",
					"netrwPlugin",
					"tarPlugin",
					"matchparen",
				},
			},
		},
	},
	-- Configure plugins
	plugins = {
		----------------------------------------------------------------
		--                      CONFIG OVERRIDES                      --
		----------------------------------------------------------------

		-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
		-- {
		--   "folke/which-key.nvim",
		--   lazy = false,
		--   config = function(plugin, opts)
		--     plugin.default_config(opts)
		--     -- Add bindings which show up as group name
		--     local wk = require "which-key"
		--     wk.register({
		--       o = { name = "Obsidian" },
		--     }, { mode = "n", prefix = "<leader>" })
		--   end,
		-- },

		-- Disable nvim-dap
		-- { "mfussenegger/nvim-dap",        enabled = false },
		-- { "jay-babu/mason-nvim-dap.nvim", enabled = false },
		-- { "rcarriga/nvim-dap-ui",         enabled = false },

		-- Add crates to cmp sources
		{
			"hrsh7th/nvim-cmp",
			opts = function(_, opts)
				opts.sources[#opts.sources + 1] = { name = "crates" }
			end,
		},

		-- Alpha Dashboard Headers
		{
			"goolord/alpha-nvim",
			config = function()
				require("alpha").setup(require("user.alpha").config)
			end,
		},

		-- Override ToggleTerm Mapping
		{
			"akinsho/toggleterm.nvim",
			opts = {
				open_mapping = [[<C-\>]],
			},
		},

		-- Override NeoTree Position Config
		{
			"nvim-neo-tree/neo-tree.nvim",
			opts = {
				window = {
					position = "right",
				},
			},
		},

		-- Override Heirline Config
		{
			"rebelot/heirline.nvim",
			opts = statusline_config,
		},

		----------------------------------------------------------------
		--                          PLUGINS                           --
		----------------------------------------------------------------

		-- Catppuccin
		{
			"catppuccin/nvim",
			opt = false,
			as = "catppuccin",
			config = function()
				-- latte, frappe, macchiato, mocha
				vim.g.catppuccin_flavour = "mocha"
				-- local colors = require("catppuccin.palettes").get_palette()
				require("catppuccin").setup({
					transparent_background = true,
					term_colors = true,
					styles = {
						comments = { "italic" },
						functions = { "italic", "bold" },
						keywords = { "italic" },
					},
					color_overrides = {
						mocha = {
							rosewater = "#EA6962",
							flamingo = "#EA6962",
							pink = "#D3869B",
							mauve = "#D3869B",
							red = "#EA6962",
							maroon = "#EA6962",
							peach = "#BD6F3E",
							yellow = "#D8A657",
							green = "#A9B665",
							teal = "#89B482",
							sky = "#89B482",
							sapphire = "#89B482",
							blue = "#7DAEA3",
							lavender = "#7DAEA3",
							text = "#D4BE98",
							subtext1 = "#BDAE8B",
							subtext0 = "#A69372",
							overlay2 = "#8C7A58",
							overlay1 = "#735F3F",
							overlay0 = "#958272",
							surface2 = "#4B4F51",
							surface1 = "#2A2D2E",
							surface0 = "#232728",
							base = "#1D2021",
							mantle = "#191C1D",
							crust = "#151819",
						},
						latte = {
							rosewater = "#c14a4a",
							flamingo = "#c14a4a",
							pink = "#945e80",
							mauve = "#945e80",
							red = "#c14a4a",
							maroon = "#c14a4a",
							peach = "#c35e0a",
							yellow = "#a96b2c",
							green = "#6c782e",
							teal = "#4c7a5d",
							sky = "#4c7a5d",
							sapphire = "#4c7a5d",
							blue = "#45707a",
							lavender = "#45707a",
							text = "#654735",
							subtext1 = "#7b5d44",
							subtext0 = "#8f6f56",
							overlay2 = "#a28368",
							overlay1 = "#b6977a",
							overlay0 = "#c9aa8c",
							surface2 = "#A79C86",
							surface1 = "#C9C19F",
							surface0 = "#DFD6B1",
							base = "#f7f0d0",
							mantle = "#F3EAC1",
							crust = "#E7DEB7",
						},
					},
					show_end_of_buffer = false,
					custom_highlights = function(colors)
						return {
							NormalFloat = { bg = "" },
							FloatBorder = { fg = colors.surface2 },
							VertSplit = { bg = "", fg = colors.surface2 },
							CursorLineNr = { fg = colors.green },
							LineNr = { fg = colors.surface2 },
							Pmenu = { bg = colors.crust, fg = "" },
							PmenuSel = { bg = colors.surface0, fg = "" },
							TelescopeSelection = { bg = colors.surface0 },
							TelescopePromptCounter = { fg = colors.mauve },
							TelescopePromptPrefix = { bg = colors.surface0 },
							TelescopePromptNormal = { bg = colors.surface0 },
							TelescopeResultsNormal = { bg = colors.mantle },
							TelescopePreviewNormal = { bg = colors.crust },
							TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
							TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
							TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
							TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
							TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
							TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
							IndentBlanklineChar = { fg = colors.surface0 },
							IndentBlanklineContextChar = { fg = colors.surface2 },
							GitSignsChange = { fg = colors.peach },
							NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
							NvimTreeExecFile = { fg = colors.text },
						}
					end,
				})
			end,
		},

		-- lsp_lines (pretty diagnostics)
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			after = "mason-lspconfig.nvim",
			module = "lsp_lines",
			config = function()
				require("lsp_lines").setup()
			end,
		},

		-- noice (cmd bar, notify, etc.)
		{
			"folke/noice.nvim",
			after = "nui.nvim",
			event = "VimEnter",
			config = function()
				require("noice").setup({
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
					},
				})
			end,
		},

		-- Hop
		{
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		},

		-- Lua copilot
		{
			"zbirenbaum/copilot.lua",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("copilot").setup({
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
								accept = "<C-a>",
								next = "<M-]>",
								prev = "<M-[>",
								dismiss = "<C-]>",
							},
						},
						filetypes = {
							markdown = true,
						},
					})
				end, 100)
			end,
		},

		-- Rust tools
		{ "simrat39/rust-tools.nvim" },

		-- Crates (Rust)
		{
			"saecki/crates.nvim",
			tag = "v0.3.0",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup()
			end,
			event = { "BufEnter Cargo.toml" },
		},

		-- Huff syntax highlighting
		{ "wuwe1/vim-huff" },

		-- Noir syntax highlighting
		{ "Louis-Amas/noir-vim-support" },

		-- Rainbow brackets
		{ "HiPhish/nvim-ts-rainbow2" },
	},
	-- Custom icons
	icons = {
		VimIcon = "",
	},
	-- Customize Heirline options
	heirline = {
		separators = {
			left = { "", " " }, -- separator for the left side of the statusline
			right = { " ", "" }, -- separator for the right side of the statusline,
		},
	},
	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.noir = {
			install_info = {
				url = "https://github.com/hhamud/tree-sitter-noir", -- the url for this tree-sitter grammar
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
			filetype = "noir", -- if filetype does not agrees with parser name you can define this field
		}

		require("nvim-treesitter.configs").setup({
			ensure_installed = "noir", -- The custom parser
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
		})
	end,
}

return config
