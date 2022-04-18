function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! fzfGit#gitfiles(args)
  let l:root = s:get_git_root()
  if empty(l:root) || empty(system('git ls-files ' . a:args . ' 2> /dev/null'))
    " return utils#warn('Not in git repo!!!')
    let l:root = './'
    let l:source = 'rg --files ' . a:args . ' | uniq'
    let l:prompt = '"Files> "'
  else
    let l:source = 'git ls-files ' . a:args . ' | uniq'
    let l:prompt = '"GitFiles> "'
  endif

  return fzf#run(fzf#wrap('gfiles', {
  \ 'source':  l:source,
  \ 'dir':     root,
  \ 'options': '-m --prompt ' . l:prompt
  \}, 0))
endfunction
