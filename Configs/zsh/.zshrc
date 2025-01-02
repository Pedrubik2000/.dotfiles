if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
    git
    zsh-autosuggestions
    rust
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

if [[ "$(which cargo)" = "/usr/bin/cargo" ]]; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
fi

export MANPAGER='nvim +Man!'
export MANWIDTH=999


# Enable Cargo's autocompletion
