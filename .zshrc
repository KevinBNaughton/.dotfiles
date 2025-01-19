# For manaing my .dotfiles GitHub
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# https://stackoverflow.com/questions/54607309/how-to-detect-os-and-load-zsh-settings-conditionally
if [[ $(uname) == "Darwin" ]]; then
  # Note to self: I am so glad to not be using brackets anymore in bash. They looked so bad.
  source "$HOME/zshrc/mac.zsh"
elif command -v apt > /dev/null; then
  source "$HOME/zshrc/debian.zsh"
else
  printf 'Unknown OS!\n'
fi
