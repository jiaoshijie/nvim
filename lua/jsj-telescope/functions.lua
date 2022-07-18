local _M = {}

_M.Jsj_search_all_files = function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--no-ignore", "--files" },
    file_ignore_patterns = {
      "%.bmp",
      "%.png",
      "%.jpg",
      "%.gif",
      "%.img",
      "%.iso",
      "%.zip",
      "%.7z",
      "%.rar",
      "%.gz",
      "%.tar",
      "%.gzip",
      "%.bz2",
      "%.tgz",
      "%.xz",
      "%.wav",
      "%.mp3",
      "%.chm",
      "%.epub",
      "%.pdf",
      "%.mobi",
      "%.ttf",
      "%.mp4",
      "%.avi",
      "%.flv",
      "%.mkv",
      "%.swf",
      "%.srt",
      "%.mdd",
      "%.mdx",
      "venv",
      "__pycache__",
    },
  })
end

_M.Jsj_neovim_config = function()
  require("telescope.builtin").find_files({
    prompt_title = "~ neovim config ~",
    prompt_prefix = "Nvim> ",
    cwd = "~/.config/nvim",
  })
end

_M.Jsj_open_Code = function()
  require("telescope.builtin").find_files({
    prompt_title = "~ Code ~",
    prompt_prefix = "Code> ",
    cwd = "~/Downloads/Code",
  })
end

_M.Jsj_open_Notes = function()
  require("telescope.builtin").find_files({
    prompt_title = "~ Notes ~",
    prompt_prefix = "Notes> ",
    cwd = "~/Downloads/GDrive/NOTE",
    file_ignore_patterns = {
      "%.bmp",
      "%.png",
      "%.jpg",
      "%.gif",
      "%.img",
      "%.iso",
    },
  })
end

return _M
