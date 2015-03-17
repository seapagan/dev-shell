# set the prompt to useful and a bit of colour...
export PS1="[\[\033[32m\[\u@Development \[\033[33m\]\W]\[\033[0m\]\$ "

# so gcc etc can find the local libraries and headers ...
export CFLAGS="-I/usr/local/include"
export CPATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib

# so openssl can be found...
#export OPENSSL_PREFIX=/usr/local

# set a few useful aliases...
alias ls='ls --color -h'
alias ll='ls -Al'
alias cdh='cd $HOME'
alias clear='cls'

