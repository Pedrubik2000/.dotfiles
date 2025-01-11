#!/bin/bash

confirm() {
    while true; do
        read -rp "$1 [Y/n]: " choice
        case "$choice" in
        y | Y) return 0 ;;
        n | N) return 1 ;;
        *) echo "Please answer y or n." ;;
        esac
    done
}

if confirm "Clean package cache?"; then
    echo "Executing: sudo pacman -Sc"
    sudo pacman -Sc
else
    echo "Skip..."
fi

echo "List unused packages..."
eval "sudo pacman -Qtdq"
if confirm "Remove unused packages (orphans)?"; then
    echo "Executing: sudo pacman -Rns $(pacman -Qtdq)"
    sudo pacman -Rns "$(pacman -Qtdq)"
else
    echo "Skip..."
fi

echo "Size of Cache:"
eval "sudo du -sh ~/.cache/"
if confirm "Remove cache?"; then
    echo "Executing: rm -rf ~/.cache/*"
    rm -rf ~/.cache/*
else
    echo "Skip..."
fi

echo "Try with rmlint and ncdu"
