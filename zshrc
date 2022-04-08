alias proxy_on='export http_proxy="http://proxyout.lanl.gov:8080" no_proxy="*.lanl.gov"
export https_proxy=$http_proxy'
alias proxy_off='export http_proxy= https_proxy= no_proxy='
proxy_on # enable the proxy by default


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/zjibben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [ "ansi" = "$TERM" ]; then
    export PROMPT='[%*] %m:%1~ ❯ '
    export PROMPT_COMMAND='' PAGER=cat
else
    ZSH_THEME="philips"
    #ZSH_THEME="intheloop"
fi
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="gianu"
#ZSH_THEME="philips"
#ZSH_THEME="risto"
#ZSH_THEME="crunch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
#export PS1='\[\e[34;1m\]\u\[\e[0m\]@\[\e[31;1m\]\h\[\e[0m\]:\[\e[32;1m\]\W\[\e[0m\]\$ '

alias ls='ls -G'
alias less='less -iR'
alias ssh='ssh -Y'
alias du1='du -hd 1 | sort -h'
alias dfh='df -h -x tmpfs -x devtmpfs'
alias ipython='ipython --no-confirm-exit'
alias pip='pip3'
alias python='python3'
alias calc='ipython --no-confirm-exit -i -c "from math import *; import numpy as np"'
alias ctestsafe='ctest --repeat until-pass:2'

# Emacs-lite: load up an independent emacs session with a lighter version of my init file
alias eml='emacs -nw -q -l ~/.emacs.d/init-lite.el'

alias ssh_tunnel_lanl='ssh -t erdelyi ssh -fNT zjibben.nsupdate.info -R 10000:localhost:22'
alias ssh_tunnel_lanl_kill='ssh erdelyi "pkill -f \"ssh -fNT\""'

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/make/libexec/gnubin:$PATH
export PATH=$HOME/opt/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=/usr/local/Cellar/universal-ctags/p5.9.20220327.0/bin:$PATH

export GPG_TTY=$(tty)

source /usr/local/opt/lmod/init/profile
export MODULEPATH_ROOT=$HOME/codes/modulefiles/macos
export MODULEPATH=$MODULEPATH_ROOT/Core:$MODULEPATH

. ~/codes/spack/share/spack/setup-env.sh

# # set up zsh-completions
# if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#     autoload -Uz compinit
#     compinit
# fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
