#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'

alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'
eval -- "$(/usr/bin/starship init bash --print-full-init)"
# export LS_COLORS="$(vivid generate one-dark)"

# this is default style linux tango sytle 
eval "$(dircolors)"
#export LS_COLORS="$(vivid generate one-dark)"

setxkbmap -layout "us,tel" -option "grp:win_space_toggle"


