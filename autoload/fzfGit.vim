function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! fzfGit#gitfiles(args)
  let l:root = s:get_git_root()
  if empty(l:root)
    return utils#error('Not in git repo!!!')
  else
    let l:source = 'git ls-files --others --exclude-standard --cached' . a:args . ' | uniq'
    let l:prompt = '"GitFiles> "'
  endif

  return fzf#run(fzf#wrap('gfiles', {
  \ 'source':  l:source,
  \ 'dir':     root,
  \ 'options': '-m --prompt ' . l:prompt
  \}, 0))
endfunction
