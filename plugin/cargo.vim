if exists('g:vim_cargo')
  finish
endif
let vim_cargo=1

autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs setlocal makeprg=cargo

if !exists('g:cargo_command')
  let g:cargo_command = "make {cmd}"
endif

com! -nargs=* CargoBench call cargo#('bench ' . <q-args>)
com! -nargs=* CargoBuild call cargo#('build ' . <q-args>)
com! -nargs=* CargoCheck call cargo#('check ' . <q-args>)
com! -nargs=* CargoClean call cargo#('clean ' . <q-args>)
com! -nargs=* CargoDoc call cargo#('doc ' . <q-args>)
com! -nargs=* CargoRun call cargo#('run ' . <q-args>)
com! -nargs=* CargoTest call cargo#('test ' . <q-args>)
com! -nargs=* CargoUpdate call cargo#('update ' . <q-args>)
com! -complete=file -nargs=+ CargoNew call cargo#('new ' . <q-args>)

func! cargo#(cmd)
  let s:cargo_command = substitute(g:cargo_command, "{cmd}", a:cmd, 'g')
  execute s:cargo_command
endf
