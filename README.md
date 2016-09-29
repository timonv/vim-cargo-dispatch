# Vim Cargo

Simple vim command bindings to quickly run cargo stuff from vim.

## Commands Available, mapping with their Cargo equivalant:

* CargoBuild, CargoBuildSuper
* CargoRun, CargoRunSuper
* CargoTest, CargoTestSuper
* CargoBench, CargoBenchSuper

The *super* versions of these functions detects the outer-most `Cargo.toml` file -
useful to build the outer project when developing nested crates.


## Installation

It's recommended to use a plugin manager to manage your vim plugins. A few examples:

### Vundle

Plugin 'timonv/vim-cargo'

### Plug

Plug 'timonv/vim-cargo'


### NeoBundle

NeoBundle 'timonv/vim-cargo'

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
