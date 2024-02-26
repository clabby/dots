return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local colors = require("catppuccin.utils.colors")
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = false,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "#151819",
          background = "#151819",
        },
      },
      highlights = {
        FloatBorder = {
          guifg = colors.subtext1,
        },
      },
    })
  end,
}
