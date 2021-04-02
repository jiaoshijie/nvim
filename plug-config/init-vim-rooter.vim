" =======
" vim-rooter
" =======

let g:rooter_targets = '/,*'

let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh', '.root', '.coc-project']

" 如果打开一个 Non-project files
let g:rooter_change_directory_for_non_project_files = 'home'

let g:rooter_manual_only = 0

" 不管符号链接
let g:rooter_resolve_links = 0
