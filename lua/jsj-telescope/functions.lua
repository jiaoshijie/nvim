local _M = {}

_M.Jsj_search_all_files = function()
  require('telescope.builtin').find_files {
    prompt_prefix = '🔍 ',
    find_command = { 'rg', '--no-ignore', '--files' },
    file_ignore_patterns = {
      "%.bmp", "%.png", "%.jpg", "%.gif", "%.tga", "%.pcx", "%.ppm", "%.img", "%.iso",
      "%.zip", "%.7z", "%.rar", "%.gz", "%.tar", "%.gzip", "%.bz2", "%.tgz", "%.xz",
      "%.wav", "%.mp3", "%.ogg", "%.pcm",
      "%.chm", "%.epub", "%.pdf", "%.mobi", "%.ttf",
      "%.mp4", "%.avi", "%.flv", "%.mov", "%.mkv", "%.swf", "%.swc", "%.srt",
      "%.mdd", "%.mdx"
    },
  }
end

_M.Jsj_neovim_config = function()
  require('telescope.builtin').find_files {
    prompt_title = "~ neovim config ~",
    prompt_prefix = "Nvim> ",
    cwd = "~/.config/nvim",
  }
end

_M.Jsj_open_Code = function()
  require('telescope.builtin').find_files {
    prompt_title = "~ Code ~",
    prompt_prefix = "Code> ",
    cwd = '~/Downloads/Code',
  }
end

_M.Jsj_open_Notes = function()
  require('telescope.builtin').find_files {
    prompt_title = "~ Notes ~",
    prompt_prefix = "Notes> ",
    cwd = '~/Nutstore Files/Nutstore/MARKDOWN_NOTE',
    file_ignore_patterns = {
      "%.bmp", "%.png", "%.jpg", "%.gif", "%.tga", "%.pcx", "%.ppm", "%.img", "%.iso",
    },
  }
end

_M.Jsj_open_Org = function()
  require('telescope.builtin').find_files {
    prompt_title = "~ Org ~",
    prompt_prefix = "Org > ",
    cwd = '~/Nutstore Files/Nutstore/Org',
    file_ignore_patterns = {
      "%.bmp", "%.png", "%.jpg", "%.gif", "%.tga", "%.pcx", "%.ppm", "%.img", "%.iso",
    },
  }
end

return _M
