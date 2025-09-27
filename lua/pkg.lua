local command = vim.api.nvim_create_user_command
local system = vim.fn.system
local uv = vim.uv

-- Add help file: https://neovim.io/doc/user/usr_05.html#05.6

local _plugin_dir = vim.fn.stdpath('data') .. '/site/pack/plugins/start/'
local _plugin_doc_dir = vim.fn.stdpath('data') .. '/site/doc/'
local _plugins = {
    { uri = "nvim-treesitter/nvim-treesitter", doc = "nvim-treesitter.txt", branch = "main" },
    { uri = "ibhagwan/fzf-lua", doc = { "fzf-lua-opts.txt", "fzf-lua.txt" } },

    { uri = "tpope/vim-fugitive", doc = "fugitive.txt" },
    { uri = "tpope/vim-surround", doc = "surround.txt" },
    "tpope/vim-repeat",

    { uri = "godlygeek/tabular", doc = "Tabular.txt" },
}

local parse_plugin = function(plugin)
    local uri, extra = nil, {}
    if type(plugin) == "string" then
        uri = plugin
    else
        uri = plugin.uri
        extra.doc = plugin.doc
        extra.branch = plugin.branch
    end

    local plugin_name = string.match(uri,  '[^/]+$')
    return 'https://github.com/' .. uri, plugin_name, extra
end

local install_plugins = function()
    -- Check whether the target directory has been already be a git directory
    system({ 'git', '-C', _plugin_dir, 'rev-parse' })

    if vim.v.shell_error ~= 0 then
        print('Making ' .. _plugin_dir .. ' to git directory')
        system({ 'mkdir', '-p', _plugin_dir })
        system({ 'mkdir', '-p', _plugin_doc_dir })
        print(system({ 'git', '-C', _plugin_dir, 'init' }))
    end

    for _, plugin in ipairs(_plugins) do
        local url, name, extra_flags = parse_plugin(plugin)
        local dir = uv.fs_stat(_plugin_dir .. name)
        if not dir then
            print('Installing ' .. url .. '...')

            local cmd = { 'git', '-C', _plugin_dir, 'submodule', 'add', '-f' }
            if extra_flags.branch then
                table.insert(cmd, '-b')
                table.insert(cmd, extra_flags.branch)
            end
            table.insert(cmd, url)
            table.insert(cmd, './' .. name)

            print(system(cmd))

            if extra_flags.doc then
                if type(extra_flags.doc) == "string" then
                    local dst_doc = _plugin_doc_dir .. extra_flags.doc
                    local src_doc = _plugin_dir .. name .. '/doc/' .. extra_flags.doc
                    system({ 'ln', '-sf', src_doc, dst_doc })
                elseif type(extra_flags.doc) == "table" then
                    for _, doc in ipairs(extra_flags.doc) do
                        local dst_doc = _plugin_doc_dir .. doc
                        local src_doc = _plugin_dir .. name .. '/doc/' .. doc
                        system({ 'ln', '-sf', src_doc, dst_doc })
                    end
                end
            end
        end
    end

    print(system({
        'git', '-C', _plugin_dir,
        'submodule', 'update', '--init', '--recursive'
    }))
    vim.cmd('helptags ' .. _plugin_doc_dir)
    print("Plugins install finished, Restart NeoVim to Enable All Plugins.")
end

local update_plugins = function()
    print('Upadting plugins ...')
    print(system({
        'git', '-C', _plugin_dir,
        'submodule', 'update', '--init', '--recursive',
        '-f', '--remote',
    }))
    vim.cmd('helptags ' .. _plugin_doc_dir)
    print('Plugins update finished, Restart NeoVim to Reload Plugins.')
end

local clean_plugins = function()
    local plugin_dir_iter = uv.fs_scandir(_plugin_dir)
    local dir_next = function() return uv.fs_scandir_next(plugin_dir_iter) end

    for dir_name, _ in dir_next do
        if string.sub(dir_name, 1, 1) ~= '.' then
            local exist = #vim.tbl_filter(function(uri)
                local _, name, _ = parse_plugin(uri)
                return name == dir_name
            end, _plugins) == 1

            if not exist then
                print('Cleaning ' .. dir_name .. ' package...')
                system({
                    'git', '-C', _plugin_dir,
                    'submodule', 'deinit', '-f', dir_name,
                })
                system({
                    'git', '-C', _plugin_dir,
                    'rm', '--cached', dir_name,
                })
                system({
                    'git', '-C', _plugin_dir,
                    'config', '-f', '.gitmodules', '--remove-section',
                    'submodule.' .. dir_name,
                })
                system({
                    'git', '-C', _plugin_dir,
                    'add', '-A',
                })
                system({ 'rm', '-rf', _plugin_dir .. dir_name })
                system({ 'rm', '-rf', _plugin_dir .. '.git/modules/' .. dir_name  })

                package.loaded[dir_name] = nil

                -- Always try to remove broken symbol link
                system({
                    'find', '-L', _plugin_doc_dir, '-type', 'l',
                    '-exec', 'rm {};',
                })
                vim.cmd('helptags ' .. _plugin_doc_dir)

                print('Plugins clean finished.')
            end
        end
    end
end

command("PkgInstall", install_plugins, { nargs = 0 })
command("PkgUpdate", update_plugins, { nargs = 0 })
command("PkgClean", clean_plugins, { nargs = 0 })
