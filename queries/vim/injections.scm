((comment) @injection.content
  (#set! injection.language "comment"))

((set_item
  option: (option_name) @_option
  value: (set_value) @injection.content)
  (#any-of? @_option
    "includeexpr" "inex" "printexpr" "pexpr" "formatexpr" "fex" "indentexpr" "inde" "foldtext" "fdt"
    "foldexpr" "fde" "diffexpr" "dex" "patchexpr" "pex" "charconvert" "ccv")
  (#set! injection.language "vim"))
