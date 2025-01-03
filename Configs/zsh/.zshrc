export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
    git
    rust
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

if [[ "$(which cargo)" = "/usr/bin/cargo" ]]; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
fi

export MANPAGER='nvim +Man!'
export MANWIDTH=999

export NVIM="$XDG_CONFIG_HOME/nvim"
if [[ ! -d "$HOME/powerlevel10k/" ]] then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

gitAddCommitPush ()
{
  git add .
  git commit -m $1
  git push
}
