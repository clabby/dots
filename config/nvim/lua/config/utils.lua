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
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

M.toggle_inlay_hints = function()
  -- h = { "<cmd>lua vim.lsp.inlay_hint(0, true)<cr>", "Enable Inlay Hints" },
  -- H = { "<cmd>lua vim.lsp.inlay_hint(0, false)<cr>", "Disable Inlay Hints" },

  if vim.b.inlay_hints then
    vim.lsp.inlay_hint(0, false)
    vim.b.inlay_hints = false
  else
    vim.lsp.inlay_hint(0, true)
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

M.change_background = function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end


M.toggle_go_test = function()
  -- Get the current buffer's file name
  local current_file = vim.fn.expand('%:p')
  if string.match(current_file, '_test.go$') then
    -- If the current file ends with '_test.go', try to find the corresponding non-test file
    local non_test_file = string.gsub(current_file, '_test.go$', '.go')
    if vim.fn.filereadable(non_test_file) == 1 then
      -- Open the corresponding non-test file if it exists
      vim.cmd.edit(non_test_file)
    else
      print('No corresponding non-test file found')
    end
  else
    -- If the current file is a non-test file, try to find the corresponding test file
    local test_file = string.gsub(current_file, '.go$', '_test.go')
    if vim.fn.filereadable(test_file) == 1 then
      -- Open the corresponding test file if it exists
      vim.cmd.edit(test_file)
    else
      print('No corresponding test file found')
    end
  end
end

return M
