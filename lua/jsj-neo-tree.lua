require('neo-tree').setup{
  close_if_last_window = false,
  popup_border_style = "rounded",
  enable_git_status = false,
  enable_diagnostics = false,
  default_component_configs = {
    indent = {
      indent_size = 2,
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "*",
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = false,
    },
  },
  filesystem = {
    filters = {
      show_hidden = false,
      respect_gitignore = false,
    },
    follow_current_file = false,
    use_libuv_file_watcher = false,  -- TODO
    hijack_netrw_behavior = "open_default",
    window = {
      position = "split",
      width = 40,
      mappings = {
        ["<cr>"] = "open",
        ["l"] = "open",
        ["-"] = "navigate_up",
        ["h"] = "close_node",
        ["a"] = "toggle_hidden",
        ["A"] = "toggle_gitignore",
        ["."] = "set_root",
        ["r"] = "refresh",
        ["R"] = "rename",
        ["D"] = "delete",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["q"] = "close_window",
        ["%"] = "add",
        ["d"] = "add",
        ["o"] = "open_split",
        ["v"] = "open_vsplit",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
      },
    },
  },
}
