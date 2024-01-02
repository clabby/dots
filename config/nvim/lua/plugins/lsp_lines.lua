-- lsp_lines (pretty diagnostics)
return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  after = "mason-lspconfig.nvim",
  module = "lsp_lines",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
  end,
}
