if exists('g:vim_cargo')
  finish
endif
let vim_cargo=1

autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs setlocal makeprg=cargo

if !exists('g:cargo_command')
  let g:cargo_command = "make {cmd}"
endif

com! CargoBuild      call cargo#run('build', 0)
com! CargoBuildSuper call cargo#run('build', 1)

com! CargoRun      call cargo#run('run', 0)
com! CargoRunSuper call cargo#run('run', 1)

com! CargoTest      call cargo#run('test', 0)
com! CargoTestSuper call cargo#run('test', 1)

com! CargoBench      call cargo#run('bench', 0)
com! CargoBenchSuper call cargo#run('bench', 1)

func! cargo#run(cmd, is_super)
  " Clear quickfix and redraw so we see when new content is available.
  call setqflist([])
  redraw!

  " Find Cargo.toml, 'is_super' finds the outer most (super-project).
  let filename = 'Cargo.toml'
  let parent_orig = expand('%:p:h')
  let filepath_found = ""
  let parent = parent_orig
  while 1
    let parent_prev = parent
    let parent_file = parent.'/'.filename
    if filereadable(parent_file)
      let filepath_found = parent_file
      if !a:is_super
        break
      endif
    endif
    let parent = fnamemodify(parent, ':h')
    if parent == parent_prev
      break
    endif
  endwhile
  if filepath_found == ""
    echom 'Cargo: "'.filename.'" not found in "'.parent_orig.'"'
    return
  endif

  let s:cargo_command = substitute(g:cargo_command, "{cmd}", a:cmd, 'g')

  " Give some indication we're doing something
  echom "Cargo..."

  " Use silent so we don't need to keep closing the errors,
  " (quickfix window auto-opens in current config).
  execute ':silent ' s:cargo_command . ' --manifest-path ' . filepath_found

  " Clear
  echon "\r"
endf
