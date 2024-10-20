return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        file_ignore_patterns = { "%.git/." },
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          previewer = false,
          -- hidden = true,
          prompt_prefix = "   ",
          file_ignore_patterns = { "node_modules", "package-lock.json" },
          initial_mode = "insert",
          select_strategy = "reset",
          sorting_strategy = "ascending",
          -- layout_strategy = "horizontal",
          layout_config = {
            --   width = 0.5,
            --   height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        pickers = {
          find_files = {
            -- theme = "dropdown",
            previewer = true,
            layout_config = {
              -- width = 0.5,
              height = 0.8,
              prompt_position = "top",
              preview_cutoff = 120,
            },
          },
          git_files = {
            previewer = true,
            layout_config = {
              height = 0.8,
              prompt_position = "top",
              preview_cutoff = 120,
            },
          },
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
              n = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
            previewer = false,
            initial_mode = "insert",
            theme = "dropdown",
            layout_config = {
              width = 0.5,
              height = 0.4,
              prompt_position = "top",
              preview_cutoff = 120,
            },
          },
          current_buffer_fuzzy_find = {
            previewer = true,
            -- theme = "dropdown",
            layout_config = {
              -- width = 0.5,
              height = 0.8,
              prompt_position = "top",
              preview_cutoff = 120,
            },
          },
          live_grep = {
            only_sort_text = true,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
          grep_string = {
            only_sort_text = true,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
          lsp_references = {
            show_line = false,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
          treesitter = {
            show_line = false,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              previewer = true,
              initial_mode = "normal",
              sorting_strategy = "ascending",
              layout_strategy = "horizontal",
              layout_config = {
                horizontal = {
                  width = 0.5,
                  height = 0.4,
                  preview_width = 0.6,
                },
              },
            }),
          },
        },
      })

      -- Extensions
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
      telescope.load_extension("zoxide")
      telescope.load_extension("enhanced_buffers")
    end,
  },
}
