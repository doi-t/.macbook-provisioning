# lang 
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# oh-my-zsh
unsetopt auto_cd

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# alias
alias vi=nvim
alias vim=nvim
alias git=/usr/local/bin/git
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

# zsh-completions
plugins+=(zsh-completions)
autoload -U compinit && compinit

# dircolors
eval "$(gdircolors ~/.dircolors-solarized)"
alias 'ls=gls --color=auto'

# root
export PATH="/usr/local/sbin:$PATH"

# direnv
export EDITOR=nvim
eval "$(direnv hook zsh)"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# brew cask
export HOMEBREW_VERBOSE=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#
# python
#
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# pythonz
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

#
# go
#
export GOBIN=${HOME}/go/bin
export PATH=$PATH:$(go env GOBIN)

#
# rust
#
source $HOME/.cargo/env

#
# gcloud & kubernetes
#
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT=$'%{$purple%}%n${PR_RST} in %{$limegreen%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)$(kube_ps1) at %{$orange%}%D{%F %T}${PR_RST}
$ '

#
# gh
#
export PATH="$HOME/.githubcli/bin:$PATH"
eval "$(gh completion -s zsh)"

#
# stern
#
source <(stern --completion=zsh)

#
# helm
#
if [ $commands[helm] ]; then
    source <(helm completion zsh)
fi

#
# fzf
#
[ -f ~/.fzf.commands.zsh ] && source ~/.fzf.commands.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --inline-info --sort 20000'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Use .. as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='..'
# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
