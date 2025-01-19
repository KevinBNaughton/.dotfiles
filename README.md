# KevinBNaughton dotfiles

## Summary

Here are my dotfiles. To start, it will be my following configs:

- zsh
- tmux
- neovim
- ghostty

I will try to update this README for what packages need to be installed for
them all to work.

## Install Packages

### Neovim

Follow the README in `.config/nvim/README.md`.

Also install 'pokemon-colorscripts'

### Ghostty

Follow the ghostty GitHub docs

### zsh

Download and start zsh. Will fail first time on a new machine.

For a new machine, 'mv $HOME/.zshrc $HOME/.zshrc_backup'

Then download and configure ohmyzsh, p10k.

Then get the changes and updates from 'dotfiles checkout' below.

### Others

TODO - Update this with packages I use like `z`.

## Summary of Medium Article

Here is my summary of commands that the
[Medium article](https://medium.com/@simontoth/best-way-to-manage-your-dotfiles-2c45bb280049)
suggests!

### First Time Setup

Create the repo, preferably in `$HOME`

```shell
mkdir .dotfiles
```

```shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Add that alias to `$HOME/.bashrc` or `$HOME/.zshrc`

```shell
dotfiles config --local status.showUntrackedFiles no
```

### New Machine Setup

Clone this repository, `mv` the old configs as backups before updating.

```shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/KevinBNaughton/.dotfiles.git $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

If seeing errors, then `mv` the old files as a backup then run checkout to fix.

```shell
mv ~/.zshrc ~/.zshrc.backup
dotfiles checkout
```
