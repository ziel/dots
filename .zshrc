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
  if [ "$(uname)" = "Darwin" ]; then
    return 0;
  fi

  return 1;
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

# Attach to or create an screen session
# Depends: screen
alias sx="screen -x &> /dev/null || screen"

# Attach to or create a tmux session
# Depends: tmux
alias tx="tmux attach &> /dev/null || tmux"

# Convert a pdf to text, perserving layout
# Depends: poppler
alias ptx="pdftotext -nopgbrk -layout"

# Nautilus Defaults
# Depends: nautilus
alias nautilus='nautilus --browser --no-desktop'

# Tree defaults
# Depends: tree, less
function tree {
  /usr/bin/env tree -A "$@" | LESSCHARSET=IBM437 less
}

# Feh Defaults
# Depends: feh
alias feh='feh --zoom-button 3 --menu-button 2 -Bblack'

# Recursive copy, skipping dotfiles.
# Depends: rsync
alias cpr="rsync -av -f '- .*'"

# Put the CWD into the clipboard
# Depends: xclip
alias px='echo -n `pwd` | xclip'

# Change dir to whatever's in the clipboard
# Depends: xclip
alias xp='cd $(xclip -o)'

# Synclient aliases
if which synclient > /dev/null; then
    alias trackon='synclient TouchpadOff=0'
    alias trackoff='synclient TouchpadOff=1'
fi

# XClip aliases
if which xclip > /dev/null; then
    alias c2x='xclip -o -selection clipboard | xclip'
    alias x2c='xclip -o | xclip -selection clipboard'
fi

# Goldielocs
# Depends: goldielocs
function goldielocs {
    eval $(/usr/local/bin/goldielocs $*)
}

# Fast switch with goldielocs
# Depends: goldielocs
alias 2='goldielocs t'

# Figlet banner
# Depends: figlet
function fmsg {
    clear && echo "\n$@" | figlet -fslant && echo
}

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
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
export MYSQL_PS1='\n\D\n\u@\h [\d]> '
export LESSEDIT=vim
export LESS='-r -S -F -X -P %lt/%m (%p/100)'

# stopgap for Darwin
# todo: check and assign
if [ isDarwin ]; then
    export PLAN9=/Users/canaan/projects/gray/plan9port
else
    export PLAN9=/opt/plan9
fi

# stopgap for Darwin
# todo: check and assign
if [ isDarwin ]; then
    alias vim=/usr/local/bin/vim
fi

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin
export PATH=$PATH:$HOME/node_modules/jasmine-node/bin

export GOBIN=$HOME/bin
export GOPATH=$HOME/lib/golib

# rbenv setup
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# -----------------------------------------
# welcome message
# -----------------------------------------

if which acpi > /dev/null; then
    acpi
fi

date '+%H and %M'
9 fortune
echo

