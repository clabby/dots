M = {}
M.on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  nmap("go", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap("gl", vim.diagnostic.open_float, "Open Diagnostic Float")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

return M
