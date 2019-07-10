# some more aliases

# shell stuff
alias grep='grep --exclude-dir=node_modules'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='ls -Gp'
alias ll='ls -Glpa'
alias less='less -FSRXc'
alias nr='npm run'

# write the zsh commands for going up directories by typing a number of dots
DOTS=..
ARG=..
for i in `seq 1 11`; do
  alias $DOTS="cd $ARG"
  DOTS="${DOTS}."
  ARG="${ARG}/.."
done

alias e=$EDITOR
alias vi=vim

# shorten misc things
alias chrome="open -a /Applications/Google\ Chrome.app/"
alias finflux='influx -host influxdb.metrics.ops.marathon.la.mesos.factual.com -port 8086'

# front docker dev shortcuts
alias bda='./bin/docker/audience-v2-dev'
alias bdb='./bin/docker/bash'
alias bdc='./bin/docker/container'
alias bdd='./bin/docker/data-preview-v2-dev'
alias bdm='./bin/docker/migrate'
alias bdr='./bin/docker/remigrate'
alias bds='./bin/docker/server'

alias devbox='ssh -p 42068 enyu@enyu-devbox.marathon.la.mesos.factual.com'

alias rn='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
