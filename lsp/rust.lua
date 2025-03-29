-- NOTE: most config just copied from https://github.com/neovim/nvim-lspconfig/
-- Because WHY NOT!!!

-- `rustup component add rust-analyzer`
return {
    name = "rust language server",
    -- TODO: check execuable also succeed, even if rust-analyzer not installed
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    root_dir = vim.fs.root(0, {"Cargo.toml", "rust-project.json", ".git"}),
    on_attach = require("lsp.on_attach"),
    filetypes = { "rust" },
}
