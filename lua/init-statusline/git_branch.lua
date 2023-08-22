local _M = {}
local fs_events = {}
local git_dir_cache = {}
local uv = vim.loop

local function get_git_head(bufnr, head_file)
  local f_head = io.open(head_file)
  if f_head then
    local HEAD = f_head:read()
    f_head:close()
    local branch = HEAD:match('ref: refs/heads/(.+)$')
    if not branch then
      branch = HEAD:sub(1, 6)
    end
    vim.fn.setbufvar(bufnr, 'Jsj_git_branch', branch)
  end
end

local function find_git_dir()
  -- get file dir so we can search from that dir
  local file_dir = vim.fn.expand('%:p:h')
  local root_dir = file_dir
  local git_dir
  -- Search upward for .git file or folder
  while root_dir do
    if git_dir_cache[root_dir] then
      git_dir = git_dir_cache[root_dir]
      break
    end
    local git_path = root_dir .. '/.git'
    local git_file_stat = uv.fs_stat(git_path)
    if git_file_stat then
      if git_file_stat.type == 'directory' then
        git_dir = git_path
      end
      if git_dir then
        local head_file_stat = uv.fs_stat(git_dir .. '/HEAD')
        if head_file_stat and head_file_stat.type == 'file' then
          break
        else
          git_dir = nil
        end
      end
    end
    root_dir = root_dir:match('(.*)/.-')
  end

  git_dir_cache[file_dir] = git_dir
  return git_dir
end

local function update_branch()
  local bufnr = vim.api.nvim_get_current_buf()
  local git_dir = find_git_dir()
  if git_dir and #git_dir > 0 then
    local w = fs_events[git_dir]
    if w then
      w:stop()
    else
      fs_events[git_dir] = uv.new_fs_event()
      w = fs_events[git_dir]
    end

    local head_file = git_dir .. '/HEAD'
    get_git_head(bufnr, head_file)
    w:start(head_file, {}, vim.schedule_wrap(function() update_branch() end))
  end
end

function _M.setup()
  local jsj_git_branch_group = vim.api.nvim_create_augroup('jsj_git_branch_group', { clear = true })

  vim.api.nvim_create_autocmd("BufRead", {
    group = jsj_git_branch_group,
    callback = function()
      update_branch()
    end
  })
end

return _M
