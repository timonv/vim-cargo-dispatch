if exists('g:vim_cargo')
  finish
endif
let vim_cargo=1

if !exists('g:cargo_command')
  let g:cargo_command = "!cargo {cmd}"
endif

com! CargoBench call cargo#run('bench')
com! CargoBuild call cargo#run('build')
com! CargoClean call cargo#run('clean')
com! CargoDoc call cargo#run('doc')
com! CargoRun call cargo#run('run')
com! CargoTest call cargo#run('test')
com! CargoUpdate call cargo#run('update')
com! -complete=file -nargs=+ CargoNew call cargo#run('new ' . string(<q-args>))

func! cargo#run(cmd)
  let s:cargo_command = substitute(g:cargo_command, "{cmd}", a:cmd, 'g')
  execute s:cargo_command
endf
