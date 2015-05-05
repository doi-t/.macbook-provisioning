#!/bin/sh
zshrc=~/.zshrc
sed -ie 's/ZSH_THEME=.*/ZSH_THEME=\"steeef\"/' $zshrc
echo '[ -f ~/.zshrc.local ] && source ~/.zshrc.local' >> $zshrc
