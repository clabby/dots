-- Sets up the Nomic Solidity LSP
-- Will be removed once the LSP is merged into the nvim-lspconfig repo
local setup_lsp = function()
  -- Nomic Solidity LSP
  local configs = require('lspconfig.configs')
  local lspconfig = require('lspconfig')
  if not configs.solidity then
    configs.solidity = {
      default_config = {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        root_dir = lspconfig.util.find_git_ancestor,
        filetypes = { "solidity" },
        single_file_support = true,
      },
    }
  end

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>lR', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
  end

  lspconfig.solidity.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

return setup_lsp
