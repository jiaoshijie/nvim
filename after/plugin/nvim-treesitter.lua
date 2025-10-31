local found, treesitter = pcall(require, "nvim-treesitter")

if not found then
    return
end

-- HINT: `query` is for .scm files
treesitter.install({
    -- NOTE: nvim builtin parsers
    "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc",

    -- NOTE: nvim not builtin parsers
    "cpp", "rust", "bash", "python", "go",
    "comment", "luadoc", "toml", "json", "jsonc", "diff",
})
