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

### Vim plugins

- ack.vim
- command-t
- delimitMate
- [neocomplete.vim](https://github.com/Shougo/neocomplete.vim) - Auto complete
- nerdtree - Tree view file explorer
- tern_for_vim - Provides Tern-based JavaScript editing support.
- vim-javascript
- vim-javascript-syntax
- vim-markdown-jekyll
- vim-node

#### tern for vim

Aftter `git submodule add`, you will `cd bundle/tern_for_vim; npm install` to
install a tern server.

And provide a config file `.tern-config` in root dir of your project.

You may providde a config file `.tern-config` for all projects, and
`.tern-project` config file for current project (in project root dir]).

### Git

- `git meld` alias

## note

turn `core.autocrlf` off, otherwise Git will convert `LF` in `.vimrc` to `CRLF`, and cause error when run Vim.

## third party tools

- `.vim/bundle/*` vim plugins
- `vendor/*`

## Install new vim plugin

```
cd .vim/bundle/
git submodule add https://github.com/moll/vim-node.git
```

TODO: how to update trd party tools.
