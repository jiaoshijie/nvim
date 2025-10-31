return {
    name = "lua language server",
    cmd = { "lua-language-server" },
    root_dir = vim.fs.root(0, { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"}),
    on_attach = require("lsp.on_attach"),
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    "${3rd}/luv/library",
                    -- "${3rd}/busted/library",
                }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
