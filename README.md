dev
===

## Installation

1. Prepare private key.

2. Clone env.

```
sudo apt-get install git
cd ~
git clone git@github.com:xxd3vin/env.git
cd env
./setup-system.sh
./setup-user.sh
```

For windows

```
cd $HOME
git clone --recursive git@github.com:xxd3vin/env.git
ln -s -v env/.vim vimfiles
ln -s -v env/.vimrc .vimrc
```

## Maintaninance

### Install new vim plugin

```
cd .vim/bundle/
git submodule add https://github.com/moll/vim-node.git
```

`.gitmodules` and `.vim/bundle/vim-node` will add to git index, then

```
git commit ...
```

### Install bash plugins

```
cd .bash/
git submodule add https://github.com/jimeh/git-aware-prompt.git
```

### Update trd party tools.

```
cd .vim/bundle/nerdtree
git pull
cd -
git add .vim/bundle/nerdtree
git commit
```

### update submodule

```
git submodule update --init
git submodule foreach git pull origin master
```

### Remove vim plugin

```
vim .gitmodules # remove neocomplete section
git add .gitmodules
vim .git/config # remove neocomplete section
git rm --cached .vim/bundle/neocomplete.vim
rm -rf .git/modules/.vim/bundle/neocomplete.vim
git commit -m "remove neocomplete for youcompleteme"
rm -rf .vim/bundle/neocomplete.vim
git push
```

## Features

### Vim plugins

- ack.vim
- command-t
- delimitMate
- [neocomplete.vim](https://github.com/Shougo/neocomplete.vim) - Auto complete
- nerdtree - Tree view file explorer
  - [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- tern_for_vim - Provides Tern-based JavaScript editing support.
- vim-javascript
- vim-javascript-syntax
- vim-markdown-jekyll
- vim-node
- [vim-jsx](https://github.com/mxw/vim-jsx)

#### tern for vim

After `git submodule add`, you will `cd bundle/tern_for_vim; npm install` to
install a tern server.

And provide a config file `.tern-config` in root dir of your project.

You may providde a config file `.tern-config` for all projects, and
`.tern-project` config file for current project (in project root dir]).

### Git

- `git meld` alias

## Dir structure

- third party tools
  - `.vim/bundle/*` vim plugins
  - `vendor/*`

## TODO

- vim related should migrate to https://github.com/xxd3vin/vimrc

## References

- https://chrisjean.com/git-submodules-adding-using-removing-and-updating/
