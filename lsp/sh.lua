-- 1. pacman -S bash-language-server shellcheck
return {
    name = "bash language server",
    cmd = { 'bash-language-server', 'start' },
    on_attach = require("lsp.on_attach"),
    filetypes = { "sh" },
    single_file_support = true,
    settings = {
        bashIde = {
            -- Glob pattern for finding and parsing shell script files in the workspace.
            -- Used by the background analysis features across files.

            -- Prevent recursive scanning which will cause issues when opening a file
            -- directly in the home directory (e.g. ~/foo.sh).
            --
            -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
            globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
        },
    },
}
