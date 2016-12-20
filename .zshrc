# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

#PROMPT="%{$purple%}%n${PR_RST} attt %{$orange%}%m${PR_RST} in %{$limegreen%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(my-env atom autojump aws brew brew-cask bundler cdd colored-man composer docker docker-compose encode64 gem git git-flow-avh git-hubflow heroku homeshick pow laravel laravel5 npm osx rails rake rbenv tig tmux vagrant web-search wp-cli zsh-syntax-highlighting)


# User configuration

export PATH="${HOME}/bin:${HOME}/sh"
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/yousan/.composer/vendor/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias df='LANG=C df'
#alias netstat='LANG=C netstat'
alias h='history 25'
alias pg='ps -o nlwp -auxww  | head -1; ps -o nlwp -auxww | grep'
alias pi8='ping 8.8.8.8'
alias today='date +%Y%m%d'
alias now='date +%Y%m%d%H%M%S'

alias ssh='ssh -o ConnectTimeout=300 -C -o CompressionLevel=9 -o ServerAliveInterval=120 -o ServerAliveCountMax=12'
alias svncowp='svn co http://core.svn.wordpress.org/trunk/'
alias iconveu='iconv -f EUC-JP -t UTF-8'
alias iconvsu='iconv -f SJIS -t UTF-8'
alias ifconfigio='curl http://ifconfig.io/ip'

#function ga() {
    # alias ga='git add -A; git commit -m "automatically commit"; git push origin master'
#    git add -A; git commit -m "automatically commit"; git push origin master'
#}


# thank you bongle!
function lh(){
    ls -lath $1 | head
}

# added by travis gem
[ -f /Users/yousan/.travis/travis.sh ] && source /Users/yousan/.travis/travis.sh
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export WP_TESTS_DIR=~/tmp/wordpress/tests-lib/
export WP_CORE_DIR=~/tmp/wordpress/core/
export DISABLE_UPDATE_PROMPT="true"

function hashed_color () {
    hash=`echo $1 | cksum | cut -d' ' -f1`
    COLOR=$(( $hash % 256 ))
    echo $COLOR
}

HOSTNAME=`hostname`
USERNAME=`whoami`
username_color=`hashed_color $USErNAME`
host_color=`hashed_color $HOSTNAME`

PROMPT=$'
%F{$username_color}%n${PR_RST} @ %F{$host_color}%M${PR_RST} in %{$limegreen%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)
$ '

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export MAILCHECK=0
