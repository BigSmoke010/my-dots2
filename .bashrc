#
# ~/.bashrc
#
export GCM_CREDENTIAL_STORE="plaintext"
export VISUAL=nvim
export EDITOR="$VISUAL"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export HISTCONTROL=ignoreboth
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export NNN_OPTS="H"
export GTK_THEME='Adawita:dark'
export LIBGL_ALWAYS_SOFTWARE=1

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control
bind -s 'set completion-ignore-case on'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# GIT commands
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
alias ls='ls --color=auto -a'
alias grep='grep -i --color'
alias feh='feh -d'
alias rm='trash-put '
alias rmls='trash-list '
alias rmclr='trash-empty '
alias sup='sudo apt update && sudo apt upgrade'
alias ls='exa --icons -a'
export PS1='\[\e[0;34m\]λ \w \[\e[0;32m\]$(parse_git_branch)> \[\e[m\]'
# export PS1='\[\e[\033[01;34m\]\u@\h \[\e[38;5;211m\]\W\[\e[\033[38;5;48m\] $(parse_git_branch)\[\e[\033[00m\]\$ '
colorscript random
export PATH="$PATH:/home/walid/.spicetify:/home/walid/.local/bin"
