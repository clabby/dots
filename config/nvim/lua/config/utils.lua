local M = {}

M.telescope_git_or_file = function()
  local path = vim.fn.expand("%:p:h")
  local git_dir = vim.fn.finddir(".git", path .. ";")
  if #git_dir > 0 then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end

M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.toggle_inlay_hints = function()
  if vim.b.inlay_hints then
    vim.lsp.inlay_hint(false)
    vim.b.inlay_hints = false
  else
    vim.lsp.inlay_hint(true)
    vim.b.inlay_hints = true
  end
end

M.toggle_set_color_column = function()
  if vim.wo.colorcolumn == "" then
    vim.wo.colorcolumn = "120"
  else
    vim.wo.colorcolumn = ""
  end
end

M.toggle_cursor_line = function()
  if vim.wo.cursorline then
    vim.wo.cursorline = false
  else
    vim.wo.cursorline = true
  end
end

-- Function to read the Alacritty config and determine the color scheme
M.get_alacritty_color_scheme = function()
  local alacritty_config_path = "/Users/ben/.config/alacritty/alacritty.toml"
  local handle = io.popen('grep "COLOR_SCHEME" ' .. alacritty_config_path)
  if handle == nil then
    return nil
  end
  local result = handle:read("*a")
  handle:close()

  -- Assuming the color scheme is mentioned as 'light' or 'dark' in the config file
  if result:find("light") then
    return "light"
  elseif result:find("dark") then
    return "dark"
  else
    return nil
  end
end

-- Function to check and update the Neovim color scheme
M.check_and_update_color_scheme = function()
  local alacritty_color_scheme = M.get_alacritty_color_scheme()
  if alacritty_color_scheme and vim.o.background ~= alacritty_color_scheme then
    vim.o.background = alacritty_color_scheme
    -- Call your function to change other configs if needed
    M.change_background(alacritty_color_scheme)
  end
end

M.copy_file = function(old_path, new_path)
  local CopyCmd = 'cp "' .. old_path .. '" "' .. new_path .. '" 2>&1' -- Redirect stderr to stdout
  local handle = io.popen(CopyCmd)
  if handle == nil then
    return false
  end
  local _ = handle:read("*a")
  local ok, _, _ = handle:close()
  return ok
end

M.change_background = function(bg)
  if bg == "light" then
    vim.o.background = "light"
    M.copy_file(
      "/Users/ben/Library/Application Support/lazygit/config-light.yml",
      "/Users/ben/Library/Application Support/lazygit/config.yml"
    )
    M.copy_file("/Users/ben/.config/alacritty/alacritty-light.toml", "/Users/ben/.config/alacritty/alacritty.toml")
  elseif bg == "dark" then
    vim.o.background = "dark"
    M.copy_file(
      "/Users/ben/Library/Application Support/lazygit/config-dark.yml",
      "/Users/ben/Library/Application Support/lazygit/config.yml"
    )
    M.copy_file("/Users/ben/.config/alacritty/alacritty-dark.toml", "/Users/ben/.config/alacritty/alacritty.toml")
  else
    print("Invalid background color")
  end
end

M.toggle_background = function()
  if vim.o.background == "dark" then
    M.change_background("light")
  elseif vim.o.background == "light" then
    M.change_background("dark")
  else
    print("Invalid background color")
  end
end

M.toggle_go_test = function()
  -- Get the current buffer's file name
  local current_file = vim.fn.expand("%:p")
  if string.match(current_file, "_test.go$") then
    -- If the current file ends with '_test.go', try to find the corresponding non-test file
    local non_test_file = string.gsub(current_file, "_test.go$", ".go")
    if vim.fn.filereadable(non_test_file) == 1 then
      -- Open the corresponding non-test file if it exists
      vim.cmd.edit(non_test_file)
    else
      print("No corresponding non-test file found")
    end
  else
    -- If the current file is a non-test file, try to find the corresponding test file
    local test_file = string.gsub(current_file, ".go$", "_test.go")
    if vim.fn.filereadable(test_file) == 1 then
      -- Open the corresponding test file if it exists
      vim.cmd.edit(test_file)
    else
      print("No corresponding test file found")
    end
  end
end

return M
