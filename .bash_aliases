# ~/.bash

# some more ls aliases
alias ll='ls -rthal'
alias la='ls -A'
alias l='ls -CF'
alias o='xdg-open'
alias k='pkill -9'
alias cl='clear'
alias q='exit'

llgrep() {
    ll | grep -i "`echo $@`"
}

lsgrep() {
    ls -l | grep -i "`echo $@`"
}

alias igrep='grep -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

function top_track()
{
  if [[ $# < 1 ]]
  then
    echo "usage: top_track PID [OPTIONAL]OUTPUTFILE"
  elif [[ $# < 2 ]]
  then
    top -p ${1} -d 1 -b | grep ${1}
  elif [[ $# < 3 ]]
  then
    top -p ${1} -d 1 -b | grep ${1} --line-buffered > ${2}
  fi
}

function top_process()
{
  if [[ $# < 1 ]]
  then
    echo "usage: top_process <process_name>"
  elif [[ $# < 2 ]]
  then
    PIDOFS=$(pidof ${1})
    PIDOFS=${PIDOFS// /,}
    top -p ${PIDOFS} -d 0.5
  fi
}

alias chars='wc -m'
alias words='wc -w'
alias lines='wc -l'

# Open file with default application (GNOME)
alias go='xdg-open'

counts()
{
  if [[ $# < 1 ]]
  then
    echo "usage: counts myfile.txt"
  else
    wc $1 | awk '{print "lines " $1 " words " $2 " characters " $3}'
  fi
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# This will probably need some update
alias clocpp='cloc --exclude-lang=HTML,CSS,Javascript,YAML,XML,Bourne Shell'

# Check if a yaml file syntax is valid
alias yamlcheck='python -c "import sys, yaml as y; y.safe_load(open(sys.argv[1]))"'

# command prompt OVERLOAD
TITLEBAR="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
COMMAND_PROMPT='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\a \[\033[00m\]${ROS_MASTER_URI}'$GIT_PS1'\n\[\033[01;34m\]\w\[\033[00m\]\$ '

PS1=$COMMAND_PROMPT
case "$TERM" in
    xterm*|rxvt*)
        PS1="$TITLEBAR$PS1"
        ;;
    *)
        ;;
esac

# Add an "alert" alias for long running commands. Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

install(){
  sudo apt-get install $1
}

alias qt='nohup qtcreator -stylesheet=/home/jeremiederay/.config/qtstyle/darcula.css &'

function set-git-user()
{
  if [[ $# < 3 ]]
  then
    echo "usage: set-git-user prenom nom mail"
  else
    git config --global user.name "$1 $2"
    git config --global user.email "$3"
  fi
}
