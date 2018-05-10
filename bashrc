#!/bin/bash

[ -z "$PS1" ] && return # if not running interactively, don't do anything

# modified/new commands =============================================================================
# use color versions of commands when they are available
hash colordiff 2>/dev/null && alias diff=colordiff
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# misc shortcuts
alias sudo='sudo ' # aliases expand right to left, so this hack lets my aliases be used within sudo
alias ssh='ssh -Y'
alias du1='du -hd 1 | sort -h'
alias dfh='df -h -x tmpfs -x devtmpfs'
alias swapcaps='setxkbmap -option ctrl:swapcaps'
alias pacaur='pacman_program=pacaur pacmatic'

# run evince on a file, put it in the background, and silence whatever it sends the terminal
function evinceq { evince "$@" &> /dev/null & }

# a couple calculators, one for quick calculations and another bringing in more advanced stuff
function calc { ipython --no-confirm-exit -ic 'from math import *'; }
function calcsci {
    ipython --no-confirm-exit -ic '
from math import *
import scipy as sp
import scipy.linalg as la
import sympy as sy
import matplotlib.pyplot as plt'
}

# some emacs functions
# open up files in emacsclient (and keep them there even after closing)
# TODO: * This is failing when provided with multiple filenames,
#         and should be expanded to loop over a list of files (delimited by spaces).
#         However, filenames themselves may also include spaces, prefixed with a \,
#         or with the entire filename enclosed with quotations, so accomplishing
#         this may involve some more complex argument parsing that might be easiest
#         to do with an awk command rather than tucked into this Elisp, or perhaps
#         write a longer function inside my Emacs init file.
function emc { emacsclient -t -a "" -e "(unless (string= \"\" \"$@\") (find-file \"$@\"))"; }
export -f emc

# Emacs-lite: load up an independent emacs session with a lighter version of my init file
alias eml='emacs -nw -q -l ~/.emacs.d/init-lite.el'

# diff files in Emacs, with command line arguments, as an alternative to vimdiff
# TODO: Expand to allow 3 or 4 files, just like vimdiff, to avoid surprises
function ediff { emacsclient -t -a "" -e "(ediff-files \"$1\" \"$2\")"; }
export -f ediff

# some local settings ===============================================================================
export PATH=$HOME/opt/:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/opt/vtk/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/opt/vtk/lib/python3.6/site-packages:$PYTHONPATH
export EDITOR=emc VISUAL='emacsclient -c -a ""'
export GPG_TTY=$(tty)
ulimit -s unlimited # unlimit stack size

# terminal settings =================================================================================
export PS1='\[\e[34;1m\]\u\[\e[0m\]@\[\e[31;1m\]\h\[\e[0m\]:\[\e[32;1m\]\W\[\e[0m\]\$ '
# ensure Emacs shell doesn't show extra garbage, doesn't use less, and opens files in buffers
[ "$TERM" == "dumb" ] && export PROMPT_COMMAND='' PAGER=cat EDITOR=emacsclient VISUAL=emacsclient
export COLORTERM=$TERM # my terminal should support color
stty -ixon # so that ctrl-s works for searching

[ "$TERM" == "xterm-256color" ] &&
    xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT 'dark' \
          -id $(xprop -root | awk '/^_NET_ACTIVE_WINDOW/ {print $5}')

# lanl stuff
alias proxy_on='export http_proxy="http://proxyout.lanl.gov:8080" no_proxy="*.lanl.gov"
export https_proxy=$http_proxy'
alias proxy_off='export http_proxy= https_proxy= no_proxy='
alias at_lanl='ping -c 1 -W 1 proxyout.lanl.gov &> /dev/null'
alias proxy_switch='at_lanl && proxy_on || proxy_off'

export MODULES_USE_COMPAT_VERSION=
. /etc/modules/init/bash
#. /etc/profile.d/env-modules.sh
#. ~/codes/spack/share/spack/setup-env.sh

# prevent bash_history from clearing
# https://bbs.archlinux.org/viewtopic.php?id=150992
# unset HISTFILESIZE
# export HISTSIZE=10000
# export HISTFILESIZE=10000
# shopt -s histappend
# export PROMPT_COMMAND='history -a'
# export HISTCONTROL=ignoredups
