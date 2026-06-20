(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
