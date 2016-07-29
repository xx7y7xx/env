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
  - vim-node
  - ack
- `git meld` alias

## note

turn `core.autocrlf` off, otherwise Git will convert `LF` in `.vimrc` to `CRLF`, and cause error when run Vim.

## third party tools

- `.vim/bundle/*` vim plugins
- `vendor/*`

TODO: how to update trd party tools.
