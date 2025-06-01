local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Adds a `desc` field to the default `opts`
local opts_with_desc = function(description)
  return { desc = description, unpack(opts) }
end

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving + quitting
map("n", "<Leader>w", ":write!<CR>", opts_with_desc("Write file"))
map("n", "<Leader>q", ":q!<CR>", opts_with_desc("Quit"))

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Navigate buffers
map("n", "]b", ":bnext<CR>", opts)
map("n", "[b", ":bprevious<CR>", opts)

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
map("n", "YY", "va{y", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "$", opts)

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw", opts)
-- Map backspace to ci in normal mode
map("n", "<BS>", "ci", opts)

-- Create splits
map("n", "\\", "<cmd>split<CR>", { nowait = true, noremap = true })
map("n", "|", "<cmd>vsplit<CR>")

-- Remove highlights w/ ESC in normal mode
map("n", "<ESC>", ":noh<CR><ESC>", opts)

-- Split line with X
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
map("n", "<C-n>", ":w %:h/", opts)

-- Toggle comment
map(
  "n",
  "<leader>/",
  function()
    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end,
  opts_with_desc("Toggle comment")
)
map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  opts_with_desc("Toggle comment")
)

-- Toggle Virtual Line Diagnostics
map(
  "n",
  "<leader>1",
  function()
    local virtual_lines_enabled = vim.diagnostic.config().virtual_lines
    local virtual_text_enabled = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
      virtual_lines = not virtual_lines_enabled,
      virtual_text = not virtual_text_enabled
    })
  end,
  opts_with_desc("Toggle LSP Lines diagnostics")
)

-- Oil
map("n", "-", ":Oil --float<CR>", opts)
map(
  "n",
  "<leader>e",
  function()
    local top_level = vim.fn.getcwd()
    vim.cmd([[:Oil --float ]] .. top_level)
  end,
  opts_with_desc("Oil (Top Level)")
)

-- Harpoon
map(
  "n",
  "<leader>hm",
  function()
    local harpoon = require('harpoon')
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end,
  opts_with_desc("Harpoon File")
)
map("n", "<leader>ha", function() require("harpoon"):list():add() end, opts_with_desc("Harpoon File"))
map("n", "<leader>h1", function() require("harpoon"):list():select(1) end, opts_with_desc("Harpoon File #1"))
map("n", "<leader>h2", function() require("harpoon"):list():select(2) end, opts_with_desc("Harpoon File #2"))
map("n", "<leader>h3", function() require("harpoon"):list():select(3) end, opts_with_desc("Harpoon File #3"))
map("n", "<leader>h4", function() require("harpoon"):list():select(4) end, opts_with_desc("Harpoon File #4"))

-- JJUI
map(
  "n",
  "<leader>gg",
  "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='jjui'}:toggle()<cr>",
  opts_with_desc("JJUI")
)
