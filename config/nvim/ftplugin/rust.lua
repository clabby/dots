local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local bindings = {
    -- Rust LSP
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Declaration", nowait = true, remap = false },
    { "<leader>lL", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics (Trouble)", nowait = true, remap = false },
    { "<leader>la", "<cmd>lua require('tiny-code-action').code_action()<cr>", desc = "Rust Code Action", nowait = true, remap = false },
    { "<leader>lc", "<cmd>lua require('config.utils').copyFilePathAndLineNumber()<CR>", desc = "Copy File Path and Line Number", nowait = true, remap = false },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition", nowait = true, remap = false },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation", nowait = true, remap = false },
    { "<leader>lk", "<cmd>lua vim.cmd.RustLsp { 'hover', 'actions' }<cr>", desc = "Hover", nowait = true, remap = false },
    { "<leader>ll", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics (Trouble)", nowait = true, remap = false },
    { "<leader>lo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition", nowait = true, remap = false },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename all references", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Trouble symbols toggle win.position=left focus=false<cr>", desc = "Display Signature Information", nowait = true, remap = false },
    -- Rust
    { "<leader>r", group = "Rust", nowait = true, remap = false },
    { "<leader>rR", "<cmd>RustLsp reloadWorkspace<cr>", desc = "Reload cargo workspace", nowait = true, remap = false },
    { "<leader>re", "<cmd>RustLsp expandMacro<cr>", desc = "Expand macro recursively", nowait = true, remap = false },
    { "<leader>rp", "<cmd>RustLsp parentModule<cr>", desc = "Go to parent module", nowait = true, remap = false },
    { "<leader>rr", "<cmd>RustLsp runnables<cr>", desc = "Rust Runnables", nowait = true, remap = false },
    { "<leader>rt", "<cmd>RustLsp openCargo<cr>", desc = "Open Cargo.toml", nowait = true, remap = false },
    -- Rust Crates
    { "<leader>C", group = "Rust Crates", nowait = true, remap = false },
    { "<leader>CA", "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", desc = "Upgrade All Crates", nowait = true, remap = false },
    { "<leader>CC", "<cmd>lua require('crates').open_crates_io()<CR>", desc = "Open Crate.io", nowait = true, remap = false },
    { "<leader>CD", "<cmd>lua require('crates').open_documentation()<CR>", desc = "Open Documentation", nowait = true, remap = false },
    { "<leader>CH", "<cmd>lua require('crates').open_homepage()<CR>", desc = "Open Homepage", nowait = true, remap = false },
    { "<leader>CR", "<cmd>lua require('crates').open_repository()<CR>", desc = "Open Repository", nowait = true, remap = false },
    { "<leader>CU", "<cmd>lua require('crates').upgrade_crate<CR>", desc = "Upgrade Crate", nowait = true, remap = false },
    { "<leader>Ca", "<cmd>lua require('crates').update_all_crates()<CR>", desc = "Update All Crates", nowait = true, remap = false },
    { "<leader>Cd", "<cmd>lua require('crates').show_dependencies_popup()<CR>", desc = "Show Dependencies Popup", nowait = true, remap = false },
    { "<leader>Cf", "<cmd>lua require('crates').show_features_popup()<CR>", desc = "Show Features", nowait = true, remap = false },
    { "<leader>Co", "<cmd>lua require('crates').show_popup()<CR>", desc = "Show popup", nowait = true, remap = false },
    { "<leader>Cr", "<cmd>lua require('crates').reload()<CR>", desc = "Reload", nowait = true, remap = false },
    { "<leader>Cu", "<cmd>lua require('crates').update_crate()<CR>", desc = "Update Crate", nowait = true, remap = false },
    { "<leader>Cv", "<cmd>lua require('crates').show_versions_popup()<CR>", desc = "Show Versions", nowait = true, remap = false },
}

which_key.add(bindings)

vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", { silent = true, desc = "Rust Hover" })
vim.keymap.set("n", "gl", "<cmd>RustLsp explainError<CR>", { silent = true, desc = "Explain error" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { silent = true, desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { silent = true, desc = "Go to declaration" })
