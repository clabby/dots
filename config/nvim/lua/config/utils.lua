local M = {}

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
  local alacritty_config_path = "$HOME/.config/alacritty/alacritty.toml"
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

-- Returns the configuration directory for lazygit.
M.lazygit_cfg = function()
  local LazyGitCmd = "(lazygit -cd | tr -d '\n') 2>&1"
  local handle = io.popen(LazyGitCmd)
  if handle == nil then
    return nil
  end
  local output = handle:read("*a")
  handle:close()
  return output
end

-- Copy a file from old_path to new_path
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

-- Change the background color of neovim, lazygit, and alacritty
M.change_background = function(bg)
  local lgCfgDir = M.lazygit_cfg()
  if lgCfgDir == nil then
    return
  end

  if bg == "light" then
    vim.o.background = "light"
    M.copy_file(lgCfgDir .. "/config-light.yml", lgCfgDir .. "/config.yml")
    M.copy_file("$HOME/.config/alacritty/alacritty-light.toml", "$HOME/.config/alacritty/alacritty.toml")
  elseif bg == "dark" then
    vim.o.background = "dark"
    M.copy_file(lgCfgDir .. "/config-dark.yml", lgCfgDir .. "/config.yml")
    M.copy_file("$HOME/.config/alacritty/alacritty-dark.toml", "$HOME/.config/alacritty/alacritty.toml")
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

return M
