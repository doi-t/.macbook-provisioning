#!/bin/sh
sed -ie 's/ZSH_THEME=.*/ZSH_THEME=\"steeef\"/'  ~/.zshrc
cat './direnv.txt' >> ~/.zshrc
