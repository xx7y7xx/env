dev
===

## Zero installation

1. Prepare private key.

2. Clone env.

```
sudo apt-get install git
cd ~
git clone --recursive --config core.autocrlf=false git@github.com:xxd3vin/env.git
cd env
./setup-system.sh
./setup-user.sh
```

## update

```
git submodule update --init 
git submodule foreach git pull origin master
```

## feature

- vim plugins
  - ack.vim
  - command-t
  - delimitMate
  - [neocomplete.vim](https://github.com/Shougo/neocomplete.vim) - Auto complete
  - nerdtree - Tree view file explorer
  - vim-javascript
  - vim-javascript-syntax
  - vim-markdown-jekyll
  - vim-node
- `git meld` alias

## note

turn `core.autocrlf` off, otherwise Git will convert `LF` in `.vimrc` to `CRLF`, and cause error when run Vim.

## third party tools

- `.vim/bundle/*` vim plugins
- `vendor/*`

## Install new vim plugin

```
git submodule add https://github.com/moll/vim-node.git
```

TODO: how to update trd party tools.
