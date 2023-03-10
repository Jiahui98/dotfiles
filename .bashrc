#!/bin/bash

[[ $- != *i* ]] && return

set -o vi

export PATH=$PATH:~/.scripts

# ETH Stuff
source /opt/Dynamatic/init_dhls.sh
source ~/Repositories/dot2smv/init_dot2smv.sh
export PATH=$PATH:/opt/nuXmv-2.0.0-Linux/bin
export PATH=$PATH:/opt/abc

export LD_LIBRARY_PATH=/usr/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

export EDITOR=vim

function run {
	[ -x ./main.sh ] &&  ./main.sh 2>&1 | tee ./output.log 
	[ -x ./run.py ] && ./run.py 2>&1 | tee ./output.log
}

# aliases 
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias zip='zip -x "*/.*"' # by default not zipping hidden files
alias ls='ls --color=auto'
alias vi='vim'
alias sh='bash'
alias xo='xdg-open .'
alias v='vi'
alias g='git'
alias t='touch'
alias e='exit'
alias q='exit'
alias :q='exit'
alias ccat="highlight --out-format=ansi"
alias gpacp='git pull && git add . && git commit -m "update" && git push'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -hN --color=auto --group-directories-first'
alias ls='ls -hN --color=auto --group-directories-first'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -vI'
alias grep='grep --color=auto'
alias eda2='ssh jiahxu@ee-tik-eda2'
alias shutdown='shutdown now'

# 

bind 'set show-all-if-ambiguous on'
bind 'set match-hidden-files off'
bind 'TAB:menu-complete'

# 


#PS1='[\u@\h \W]\$ '
# My shell prompt
export PS1="[\[$(tput sgr0)\]\[\033[38;5;208m\]\u\[$(tput sgr0)\]\[\033[38;5;99m\]@\[$(tput sgr0)\]\[\033[38;5;63m\]\h\[$(tput sgr0)\]\[\033[38;5;133m\] \[$(tput sgr0)\]\[\033[38;5;72m\]\W\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"

