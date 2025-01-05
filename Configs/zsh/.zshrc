export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVIM="$XDG_CONFIG_HOME/nvim"

if ! test -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    rust
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

if command -v cargo &> /dev/null; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
fi

updateneovim () {
    if [[ ! -z "$PREFIX" ]]; then
	pkg install neovim
    else
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
        sudo rm -rfv /opt/nvim
        sudo tar -C /opt -xzf nvim-linux64.tar.gz
	rm -v nvim-linux64.tar.gz
    fi
}
if [[ -z "$PREFIX" ]]; then
	export PATH="$PATH:/opt/nvim-linux64/bin"
fi

if ! command -v nvim &> /dev/null; then
    updateneovim
fi


export MANPAGER='nvim +Man!'
export MANWIDTH=999


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

gitAddCommitPush ()
{
  git add .
  git commit -m $1
  git push
}

mkdircp ()
{
    mkdir $1
    cp -rv $2 $1$2
}

