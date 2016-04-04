# -------------------------------------------------------------------------
# (o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)
# -------------------------------------------------------------------------
# zsh config
# -------------------------------------------------------------------------
# (o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)>#|#<.>(o)
# -------------------------------------------------------------------------

# -----------------------------------------
# options
# -----------------------------------------
autoload -U compinit
autoload -U zed
autoload -U zmv
compinit

setopt extendedglob
setopt autopushd
setopt pushdignoredups
setopt histignorealldups
setopt incappendhistory
setopt nocheckjobs
setopt nohup
setopt nobeep

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500
SAVEHIST=3000

WORDCHARS=${WORDCHARS//[&;\/]}

bindkey "^[[Z" reverse-menu-complete

# emacs keybindings
bindkey -e

# -----------------------------------------
# Check OS
# -----------------------------------------
function isDarwin
{
  [ "$(uname)" = "Darwin" ]
}

function isLinux
{
  [ "$(uname)" = "Linux" ]
}

# -----------------------------------------
# sandbox (From a&c)
# -----------------------------------------
if [ ! -d $HOME/d/`date +%Y`/`date +%B` ]; then
   mkdir -p $HOME/d/`date +%Y`/`date +%B`;
   rm -f $HOME/sandbox
   ln -s $HOME/d/`date +%Y`/`date +%B` $HOME/sandbox
fi

alias s='cd $HOME/sandbox'

# -----------------------------------------
# shell maths (from a)
# -----------------------------------------
alias fsum='perl -e "\$s=0;while(<>){chomp;\$s+=\$_;}print \$s.\"\\n\";"'
alias fmax='perl -e "\$s=0;while(<>){chomp;\$s+=\$_;}print \$s.\"\\n\";"'
alias favg='perl -e "\$c=0;\$s=0;while(<>){chomp;\$c=\$c+1;\$s+=\$_;}\$a=\$s/\$c;print \"\$a \\n\";"'

# -----------------------------------------
# keychain
# -----------------------------------------
eval $(keychain -q --nogui --eval id_rsa 2>/dev/null)

# -----------------------------------------
# aliases
# -----------------------------------------

# Git log aliases
# Depends: git, diffstat
alias lgtoday='git log --since=6:00AM --author=ziel'
alias lgsttoday='lgtoday -p | diffstat'

# Attach to or create an screen session
# Depends: screen
alias sx="screen -x &> /dev/null || screen"

# Create a top in a screen
# Depends: screen, top
alias st="screen top"

# Attach to or create a tmux session
# Depends: tmux
alias tx="tmux attach &> /dev/null || tmux"

# Convert a pdf to text, perserving layout
# Depends: poppler
alias ptx="pdftotext -nopgbrk -layout"

# Recursive copy, skipping dotfiles.
# Depends: rsync
alias cpr="rsync -av -f '- .*'"

# Google a thing
# Depends: surfraw
alias srg="sr google"

# Fix mtr
# Depends: mtr
alias mtr="TERM=linux-m mtr -t"

# Goldielocs
# Depends: goldielocs
function goldielocs {
    eval $(/usr/local/bin/goldielocs $*)
}

# Fast switch with goldielocs
# Depends: goldielocs
alias 2='goldielocs t'

# Golang path & deps management
# Depends: gvp
if which xclip > /dev/null; then
    alias gvpi='source gvp in'
    alias gvpo='source gvp out'
fi

# Figlet banner
# Depends: figlet
function fmsg {
    clear && echo "\n$@" | figlet -fslant && echo
}

# Wikipedia CLI
# Depends: telnet
alias wikipedia='telnet telnet.wmflabs.org'

# Anon Wikipedia CLI
# Depends: tor, socat
alias awikipedia='socat - SOCKS4A:localhost:lgcjxm7fttkqi2zl.onion:23,socksport=9050'

# -----------------------------------------
# fuzzy search via fzf
#
# Depends: fzf
# -----------------------------------------

# FZF Additions
. /etc/profile.d/fzf.zsh

# Extra Keybindings
if [[ $- == *i* ]]; then

  # Goldielocs + FZF
  # Depends: goldielocs, fzf
  fzf-goldielocs-widget() {
    local result=$(cat $(goldielocs file) | fzf | awk '{print $2}')

    if [ ! -z "${result}" ]; then
      cd "${result}"
    fi

    zle reset-prompt
  }

  zle -N fzf-goldielocs-widget
  bindkey '\e/' fzf-goldielocs-widget

fi

# -----------------------------------------
# prompt and term title
# -----------------------------------------
function title {
    if [[ $TERM == "xterm"
       || $TERM == "rxvt"
       || $TERM == "rxvt-unicode"
       ]]; then
        print -n "\e]0;$*\a"
    fi
}

function precmd {
    title zsh "$PWD"
}

function preexec {
    emulate -L zsh
    local -a cmd; cmd=(${(z)1})
    title $cmd[1]:t "$cmd[2,-1]"
}

export RPROMPT="%{[22;32m%}%~%{[00m%}"
export PROMPT="%# "

# -----------------------------------------
# path and env setup
# -----------------------------------------
unset LS_COLORS

export AWT_TOOLKIT=MToolkit
export EDITOR=nvim
export PAGER=/usr/bin/less
export MYSQL_PS1='\n\D\n\u@\h [\d]> '
export LESS='-R -S -F -X -P %lt/%m (%p/100)'

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/share/npm/bin

export GOBIN=$HOME/bin
export GOPATH=$HOME/lib/golib

# rbenv setup
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# -----------------------------------------
# Extras
# -----------------------------------------

# Extras for OSX
if isDarwin; then
    source $HOME/.zshrc.osx
fi

# Extras for Linux
if isLinux; then
    source $HOME/.zshrc.linux
fi

# Extras for local machine
source $HOME/.zshrc.local

# -----------------------------------------
# welcome message
# -----------------------------------------

if which acpi > /dev/null; then
    acpi
fi

date '+%H and %M'
9 fortune
echo


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
