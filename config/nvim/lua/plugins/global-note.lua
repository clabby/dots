return {
  "backdround/global-note.nvim",
  config = function()
    require("global-note").setup({
      filename = "global.md",
      directory = "~/",
    })
  end,
}
