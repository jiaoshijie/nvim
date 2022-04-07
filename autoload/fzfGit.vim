function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! fzfGit#gitfiles(args)
  let l:root = s:get_git_root()
  if empty(l:root)
    return utils#warn('Not in git repo!!!')
  endif

  return fzf#run(fzf#wrap('gfiles', {
  \ 'source':  'git ls-files ' . a:args . ' | uniq',
  \ 'dir':     root,
  \ 'options': '-m --prompt "GitFiles> "'
  \}, 0))
endfunction
