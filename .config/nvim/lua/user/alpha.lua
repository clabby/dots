local headers = {
  {
    "         __         __        ",
    "        /.-'       `-.\\      ",
    "       //             \\\\    ",
    "      /j_______________j\\    ",
    "     /o.-==-. .-. .-==-.o\\   ",
    "     ||      )) ((      ||    ",
    "      \\\\____//   \\\\____// ",
    "       `-==-'     `-==-'      ",
  },
  {
    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
    "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
  },
  {
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
    [[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
    [[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
  },
  {
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢐⠨⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡂⠅⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⣄⣄⣂⢄⠀⠀⠀⠀⠀⡀⢔⠨⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣼⣿⣿⣿⣿⣿⣯⣀⠠⡀⠅⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣺⡿⠿⢿⣿⣿⣿⣿⣿⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣧⣀⣘⣿⣿⢿⣻⣿⣿⣝⢧⣲⣄⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣡⠱⠿⣟⡈⠐⠁⣸⢉⣷⠻⣌⠻⡔⢮⡙⢶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠠⠳⣶⣯⡴⡺⣿⠺⣎⠳⣍⡳⣙⢮⡙⢧⣶⣠⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⢻⠴⣫⠕⣎⣳⣜⣹⣦⣷⣭⣶⡽⠶⠫⠫⣴⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⣏⠿⣌⢧⡛⡴⣋⠞⣥⢋⣯⡿⠟⠋⢳⣜⠻⢿⣿⡆⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⡗⣫⠳⡜⢦⣙⠶⡩⠟⠲⣇⠈⣥⣤⣤⣾⣿⣿⣿⣿⠏⠐⠄⡎⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⣜⣥⣛⣼⡗⠊⠉⠀⠀⣠⣽⣿⡷⣩⢎⡽⣟⠿⣿⣹⠀⠀⠀⠐⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢷⡾⡿⠿⠿⢄⣠⣠⣴⣿⣿⣿⣿⣷⢳⢫⠵⣩⣾⠗⣾⢠⠀⠀⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠳⠃⠁⠀⠀⣠⣧⣿⣿⣿⣿⣿⣿⣿⣭⢣⢏⣾⡝⢏⡗⣛⠈⣇⠀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⢿⡟⡴⣋⢞⣎⡞⢨⢂⡱⡥⣿⣦⡀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⢿⣿⠿⠿⢿⣿⢿⣻⣭⡟⡼⡱⣍⣾⣾⡟⣹⠢⠔⡩⢺⢿⣷⡄⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠉⠀⠀⠀⣀⣤⡶⣟⣵⡻⣼⢳⣏⡖⣳⣼⢩⠘⠤⡙⡜⢨⠑⡌⢣⣼⠿⠆⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⢻⡽⣳⢯⢷⣺⢽⣳⢿⡷⢺⠿⠟⠛⠛⠐⠁⠼⠬⠯⠽⠟⠁⠀⠀⠀⠀⡀⠀⠀⠐⡀⠀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⣿⣽⢳⢯⡽⣞⢯⣞⣳⠯⠚⣻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠀⠀⢀⡀⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠄⠂⢘⣿⣽⣫⣟⣼⡏⠷⠋⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡟⠉⠓⠀⠀⠀ ]],
    [[⠀⠀⠀⠀⠀⠀⡠⣠⡾⠖⠁⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⣀⣠⣐⣠⣤⣄⣈⠀⠀ ]],
    [[⠀⠀⠀⠀⡠⣚⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣒⠁⢹⠶⠝⠅⡢⠄⢆⢤⢉⣫⡇ ]],
    [[⠀⢀⡠⡌⢤⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⢽⣦ ]],
    [[⠰⡭⠥⠥⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠿⠼⣿ ]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠠⠀⠄⠠⠀⠄⠠⠀⠄⠠⠀⠄⠛ ]],
  },
}

local M = {}

math.randomseed(os.time())

M.section_header = {
  type = "text",
  val = headers[1],
  opts = {
    position = "center",
    hl = "WarningMsg",
  },
}

function M.buttons()
  local keybind_opts = { silent = true, noremap = true }
  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function(_)
      -- Lazy
      vim.api.nvim_buf_set_keymap(0, "n", "z", ":Lazy<CR>", keybind_opts)

      -- Toggleterm / telescope
      vim.api.nvim_buf_set_keymap(0, "n", "g", ":lua require('astronvim.utils').toggle_term_cmd('lazygit')<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "t", ":ToggleTerm<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "s", ":Telescope live_grep<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "f", ":Telescope find_files<CR>", keybind_opts)

      -- Quit
      vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q<CR>", keybind_opts)
    end,
  })

  local button_hl = {
    { "Constant", 1,  4 },
    { "Function",   5,  18 },
    { "String", 19, 25 },
    { "Comment", 25, 32 },
    { "Constant", 32, 38 },
    { "Function",   38, 50 },
    { "String", 51, 55 },
  }
  return {
    {
      type = "text",
      val = {
        "   find file      f    │       terminal      t",
        "   lazygit        g    │       quit          q",
        "鈴  lazy           z    │       search        s",
      },
      opts = {
        position = "center",
        hl = {
          button_hl, button_hl, button_hl,
        }
      },
    },
  }
end

M.section_buttons = { type = "group", val = M.buttons }

function M.info_text()
  ---@diagnostic disable-next-line:undefined-field
  local datetime = os.date(" %A, %d %B %Y")
  -- local lazy_stats = require("lazy").stats()
  -- local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
  -- local total_plugins = " " .. lazy_stats.loaded .. "/" .. lazy_stats.count .. " in " .. ms .. " ms"
  -- local version = vim.version()
  -- local nvim_version_info = " v" .. version.major .. "." .. version.minor .. "." .. version.patch
  -- vim.api.nvim_create_autocmd({ "User" }, {
  --   pattern = { "LazyVimStarted" },
  --   callback = function()
  --     pcall(vim.cmd.AlphaRedraw)
  --   end,
  -- })
  return datetime -- .. " │ " .. total_plugins .. " │ " .. nvim_version_info
end

M.section_info = {
  type = "text",
  val = function()
    return M.info_text()
  end,
  opts = {
    hl = "WarningMsg",
    position = "center",
  },
}

vim.b.miniindentscope_disable = true

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      print("alpha ready")
      -- require("lazy").show()
    end,
  })
end

M.config = {
  layout = {
    { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.35) } },
    M.section_header,
    { type = "padding", val = 1 },
    { type = "padding", val = 1 },
    M.section_buttons,
    { type = "padding", val = 1 },
    M.section_info,
  },
}

return M
