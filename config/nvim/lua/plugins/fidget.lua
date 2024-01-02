return {
  "j-hui/fidget.nvim",
  enabled = false,
  branch = "legacy",
  config = function()
    require('fidget').setup({
      window = { blend = 0 },
    })
  end
}
