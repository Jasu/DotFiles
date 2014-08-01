# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gentoo"
#ZSH_THEME="intheloop"
#ZSH_THEME="mh"
#ZSH_THEME="pygmalion"
#ZSH_THEME="tjkirch_mod"
ZSH_THEME="itchy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

. ~/z/z.sh
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/opt/local/bin:/opt/local/sbin

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/utils/recolor"
export PATH="$PATH:$HOME/utils/cssextract"
export PATH="$PATH:$HOME/utils/cssdownload"
export PATH="$PATH:$HOME/utils/lokki"
export PATH="$PATH:$HOME/utils/lokki-atrium-fetch"
export PATH="$PATH:$HOME/utils/lokki-toggl-fetch"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:/opt/sublime_text"
#export PATH="$PATH:$HOME/.composer/vendor/drush/drush/"
export PATH="$PATH:$HOME/drush/"

alias -s cpp=vim
alias -s c=vim
alias -s h=vim
alias -s hpp=vim
alias -s php=vim
alias -s module=vim
alias -s install=vim
alias -s xml=vim
alias -s lua=vim
alias -s gitignore=vim
alias -s gitmodules=vim
alias -s vimrc=vim
alias -s txt=vim
alias -s tex=vim

alias -s pdf=xdg-open
alias -s doc=xdg-open
alias -s ppt=xdg-open
alias -s xls=xdg-open
alias -s odt=xdg-open
alias -s ods=xdg-open

alias tmux="TERM=xterm-256color tmux"

alias head='head -n $((`tput lines` - 2))'
alias tail='tail -n $((`tput lines` - 2))'
headcut() { head -n $((`tput lines` - 2)) "$@" | cut -c1-`tput cols` }
tailcut() { tail -n $((`tput lines` - 2)) "$@" | cut -c1-`tput cols` }
json() { cat "$@" | python -m json.tool } 
al() { ag --color "$@" 2>&1 | less }
alias p=pman

alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

alias v="vim -o"
alias vi=vim

alias ml="make 2>&1|less"

#bindkey -v
#bindkey "^R" history-incremental-search-backward

unsetopt listambiguous
unsetopt menucomplete
setopt autolist
setopt noautomenu

autoload zcalc
autoload zmv
autoload zcp

#Disable flow-control shortcuts Ctrl+Q and Ctrl+S
stty stop ''
stty start ''
stty -ixon
stty -ixoff

if [ ! -z "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ] ; then
  unlink "$HOME/.ssh/agent_sock" 2>/dev/null
  ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
  export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

export EDITOR=vim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.profile

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}


