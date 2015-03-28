# Vim Cargo

Simple vim command bindings to quickly run cargo stuff from vim.

## Commands Available, mapping with their Cargo equivalant:

* CargoBench
* CargoBuild
* CargoClean
* CargoDoc
* CargoNew
* CargoRun
* CargoTest
* CargoUpdate

## Usage

Simply run one of the commands. By default it just delegates to cargo.

You can overwrite g:cargo_command to, for instance, support dispatch:

```
let g:cargo_command = "Dispatch cargo {cmd}"
```

## Contribute

* Fork
* Code
* Test
* Pull-request
