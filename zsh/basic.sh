#!/bin/bash

source ~/.zsh/path.sh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

for file in ~/.zsh/command/*; do
    source $file
done

# source ~/.zsh/command/alias.sh
# source ~/.zsh/command/proxy.sh
source ~/.zsh/command/env.sh




# 可选。检查g别名是否被占用
if [[ -n $(alias g 2>/dev/null) ]]; then
    unalias g
fi



export PATH="$PATH:$HOME/go/bin:$HOME/bin"
