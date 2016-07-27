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

## note

turn `core.autocrlf` off, otherwise Git will convert `LF` in `.vimrc` to `CRLF`, and cause error when run Vim.
