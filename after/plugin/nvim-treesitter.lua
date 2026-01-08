local found, treesitter = pcall(require, "nvim-treesitter")
local command = vim.api.nvim_create_user_command

if not found then
    return
end

command("TSInstallConfigured", function()
    treesitter.install({
        -- NOTE: nvim builtin parsers
        -- `query` is for .scm files
        "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc",

        -- NOTE: nvim not builtin parsers
        "cpp", "rust", "bash", "python", "go",
        "comment", "luadoc", "toml", "json", "diff",
    })
end, { nargs = 0 })
