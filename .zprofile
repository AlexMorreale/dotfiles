export EDITOR="vim"

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT
export PATH=$PATH:$GOROOT/bin

export PATH=$PATH:/usr/local/apiserver-builder/bin

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

csk () {
  LINE_NUM=$1
  sed -i "${LINE_NUM}d" ~/.ssh/known_hosts
}

random () {
  # Pass a length argument defaults to 40
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-40} | head -n 1
}

alias asl="aws s3 ls"

alias os="cd ~/open_source/projects/"
alias get_chmod="stat -f \"%OLp\" "

alias terryform="terraform"
alias ssh_u="ssh -e ~/.ssh/config_ubuntu "
alias va="vagrant"

alias :q="exit"
alias vimrc="vim ~/.vimrc"
alias c="clear"
alias cl="clear && ls -alh"
alias gi="grep -i"

alias kall="kubectl --all-namespaces"
alias kd="kubectl describe"

alias k="kubectl"

# chef exec
alias ce="chef exec"
alias cek="chef exec kitchen"

#bundle
alias be="bundle exec"

alias copy="xclip -sel clip"

# extra git alias [most come from zsh]
alias gcw='git commit -am "--wip-- [ci skip]"'
alias gbdall="git branch --merged | xargs git branch -d"
alias gds="git diff --staged"
alias gfp="git checkout master && git fetch origin --prune"
alias gpoh='git push origin HEAD'
alias grim="git rebase -i master"
alias hubmdpr="hub -c core.commentChar='%' pull-request"
alias grhdot="git reset HEAD ."

alias kdn="kubectl describe node"

alias v_s="nmcli con up id staging"
alias v_p="nmcli con up id production"
alias v_b="nmcli con up id staging && nmcli con up id production"

alias kubediff="docker run -v ~/.kube/config:/config kubediff:latest kubediff --kubeconfig=/config"

