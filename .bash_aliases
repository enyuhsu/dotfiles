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
alias bds='./bin/docker/server'
alias bdb='./bin/docker/bash'
