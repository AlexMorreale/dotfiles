# for pip
export PATH=~/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
export GIT_TERMINAL_PROMPT=1

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

plugins=(
  git
  aws
  docker
  rbenv
  kubectl
  helm
  terraform
  ansible
  kitchen
  go
)

source $ZSH/oh-my-zsh.sh

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#eval "$(chef shell-init zsh)"

# Some node stuff
# https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.node/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## asdf config
export ASDF_DATA_DIR="/home/alex/.asdf"
. $HOME/.asdf/asdf.sh
export PATH="$PATH:$ASDF_DATA_DIR/bin"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
