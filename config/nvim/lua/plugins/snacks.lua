return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
    __         __
   /.-'       `-.\
   //             \\
   /j_______________j\
   /o.-==-. .-. .-==-.o\
   ||      )) ((      ||
   \\____//   \\____//
   `-==-'     `-==-'
      ]]
      }
    },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
      scope = {
        enabled = false
      }
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>o",
      function()
        Snacks.picker.buffers({
          win = {
            input = {
              keys = {
                ["dd"] = "bufdelete",
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
              },
            },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },
    -- find
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fz", function() Snacks.picker.zoxide() end,                                  desc = "Zoxide" },
    { "<leader>fw", function() Snacks.picker.grep() end,                                    desc = "Grep in project" },
    { "<leader>fW", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
    { "<leader>fb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { '<leader>f"', function() Snacks.picker.registers() end,                               desc = "Registers" },
    { "<leader>f/", function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>fC", function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>fH", function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>fk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>fm", function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>fp", function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    { "<leader>fR", function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- git
    { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>go", function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
    -- Grep
    { "<C-s>",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    -- UI
    { "<leader>uC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                               nowait = true,                     desc = "Code Actions" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                    nowait = true,                     desc = "Rename" },
    { "<leader>lR", function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                                    nowait = true,                     desc = "Format" },

    -- Zoxide nav
    { "<leader>z",  function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
