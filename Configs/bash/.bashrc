# shellcheck shell=bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
eval "$(starship init bash)"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export NVIM="$XDG_CONFIG_HOME/nvim"

alias chromium='chromium --ozone-platform-hint=auto'

if command -v cargo &>/dev/null; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
fi

updateneovim() {
    if [[ -n "$PREFIX" ]]; then
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

if ! command -v nvim &>/dev/null; then
    updateneovim
fi
export MANPAGER='nvim +Man!'
export MANWIDTH=999
gitAddCommitPush() {
    git add .
    git commit -m "$1"
    git push
}

mkdircp() {
    mkdir -p "$1"
    cp -rv "$2" "$1$2"
}
mkdirtouch() {
    mkdir -p "$1"
    touch "$1$2"
}
gitIgnoreAdd() {
    echo "$1" >>.gitignore
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export BW_SESSION="ix/6ydypsmW72M9LuDob2fsRu8snfK1ONqva46R52Swoa6xlXDTGBIhmKcRp2OAt4LUM1MeQICdXiyN/yp+rqw=="
