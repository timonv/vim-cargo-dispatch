if exists('g:vim_cargo')
  finish
endif
let vim_cargo=1

if !exists('g:cargo_command')
  let g:cargo_command = "!cargo {cmd}"
endif

com! CargoBuild call cargo#run('build')
com! CargoRun   call cargo#run('run')
com! CargoTest  call cargo#run('test')
com! CargoBench call cargo#run('bench')
com! CargoNew   call cargo#run('new')

func! cargo#run(cmd)
  let s:cargo_command = substitute(g:cargo_command, "{cmd}", a:cmd, 'g')
  execute s:cargo_command
endf
