# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

plugins=(
  git
  aws
  docker
  kubectl
  helm
  terraform
)

source $ZSH/oh-my-zsh.sh

source $HOME/.profile
source $ZSH/colors


function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function remove_line() {
  if [ $2 == "" ]; then
    echo "remove_line requires a line number and a file name \'remove_line 20 ~/.ssh/known_hosts\' "
  fi
  sed -e "$1d" $2
}

export TERM="xterm-256color"
autoload -U colors && colors
alias rl
export PROMPT='$YEL%n@%m $RS$WHT::$RS$GRN $(get_pwd)$RS $(git_prompt_info)$RS${ret_status} '

export LC_COLLATE="C"
export LS_COLORS="di=01;93:ln=01;93:pi=40;33:so=01;35:do=01;37:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";


# TOOO: install fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# 
# TOOO: install asdf
# . $HOME/.asdf/asdf.sh
# 
# . $HOME/.asdf/completions/asdf.bash

