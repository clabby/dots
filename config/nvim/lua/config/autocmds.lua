local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
api.nvim_create_autocmd("BufEnter", {
  callback = function() end,
})

-- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set color column on in active buffer
local columnGrp = api.nvim_create_augroup("ColorColumn", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  command = [[set colorcolumn=120]],
  group = columnGrp
})
api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  command = [[set colorcolumn=0]],
  group = columnGrp
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")
