-- sudo pacman -S treesitter
local found, treesitter_configs = pcall(require, "nvim-treesitter.configs")
local uv = vim.loop

if not found then
    return
end

treesitter_configs.setup({
    ensure_installed = {
        "comment", "cpp", "go", "rust", "toml",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(_, buf)        -- (lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    incremental_selection = { enable = false },
    indent = { enable = false },
})
