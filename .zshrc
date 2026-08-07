export PATH="/home/yousan/.nvm/versions/node/v22.22.3/bin:$PATH"
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
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
plugins=(brew bundler cake composer docker docker-compose encode64 git kubectl laravel npm tig web-search wp-cli zsh-completions zsh-autosuggestions zsh-syntax-highlighting)
# disabled atom bundler cdd gem
# zsh-syntax-highlighting は最後に置くこと（他プラグインの zle wrapper を壊さないため）

# oh-my-zsh 同梱ではない外部プラグインが無ければ自動で取得する。
# 初回起動時だけ clone が走る（2回目以降はディレクトリ判定のみでコストなし）。
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
typeset -A _ext_plugins=(
  zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
  zsh-autosuggestions     https://github.com/zsh-users/zsh-autosuggestions.git
  zsh-completions         https://github.com/zsh-users/zsh-completions.git
)
for _p in ${(k)_ext_plugins}; do
  if [[ ! -d $ZSH_CUSTOM/plugins/$_p ]] && (( $+commands[git] )); then
    echo "[zshrc] installing $_p ..."
    GIT_TERMINAL_PROMPT=0 git clone -q --depth=1 \
      $_ext_plugins[$_p] $ZSH_CUSTOM/plugins/$_p \
      || echo "[zshrc] failed to install $_p (skipped)"
  fi
  # clone に失敗した場合は plugins から外して 'plugin not found' を出さない
  [[ -d $ZSH_CUSTOM/plugins/$_p ]] || plugins=(${plugins:#$_p})
done
unset _p
unset _ext_plugins

# User configuration

export PATH="$PATH:./node_modules/.bin/" # 現在ディレクトリのnode_modules
export PATH="$PATH:./vendor/bin/"
export PATH="$PATH:${HOME}/bin:${HOME}/sh"
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/yousan/.composer/vendor/bin"
export PATH="$PATH:${HOME}/.nodebrew/current/bin/"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"

export PATH="${HOME}/go/bin:${PATH}"
export GOPATH="${HOME}/go"


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

# alias ssh='ssh -o ConnectTimeout=300 -C -o CompressionLevel=9 -o ServerAliveInterval=120 -o ServerAliveCountMax=12'
alias ssh='ssh -o ConnectTimeout=300 -C -o ServerAliveInterval=120 -o ServerAliveCountMax=12'
alias svncowp='svn co http://core.svn.wordpress.org/trunk/'

# SJISについてはバックスラッシュを変換できるようにするため、CP932を指定すると良い  https://qiita.com/kjunichi/items/518e337d29cc5bf6a70b
alias iconveu='iconv -f EUC-JP -t UTF-8'
alias iconvsu='iconv -f cp932 -t UTF-8'
alias iconvus='iconv -f UTF-8 -t cp932'
alias ifconfigio='curl http://ifconfig.io/ip'
alias op='open -a PhpStorm'
alias os='open -a SourceTree'
# alias git='hub'
alias curlhead='curl -o /dev/null -s -D - '
# claude のフルパスを使って alias の再帰を避ける
# alias claude='claude --dangerously-skip-permissions --continue'
# alias claude='command claude --dangerously-skip-permissions'

claude() {
  local _proj="$(basename "$PWD")"
  local _otel_extra="cwd=$PWD,project=$_proj,host.user=$USER,host.name=$(hostname)"
  OTEL_RESOURCE_ATTRIBUTES="${_otel_extra}${OTEL_RESOURCE_ATTRIBUTES:+,$OTEL_RESOURCE_ATTRIBUTES}" \
    command claude --dangerously-skip-permissions --continue "$@" 2>/dev/null \
    || OTEL_RESOURCE_ATTRIBUTES="${_otel_extra}${OTEL_RESOURCE_ATTRIBUTES:+,$OTEL_RESOURCE_ATTRIBUTES}" \
       command claude --dangerously-skip-permissions "$@"
}

# Claude用
## コンテキストクリア、権限確認をスキップする
export CLAUDE_ALWAYS_ALLOW=true



#function ga() {
    # alias ga='git add -A; git commit -m "automatically commit"; git push origin master'
#    git add -A; git commit -m "automatically commit"; git push origin master'
#}


# thank you bongle!
# function lh(){
#     ls -lath $1 | head
# }

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

export MAILCHECK=0

# fzf @see https://qiita.com/kamykn/items/aa9920f07487559c0c7e
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# from Yamashou
# autoload select-history-cmd
# zle -N select-history
# bindkey '^r' select-history
# function select-history() {
#   BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
#   CURSOR=$#BUFFER
# }

# frepo  @see https://blog.fakiyer.com/entry/2016/01/29/142620
function frepo() {
  local dir
  dir=$(ghq list > /dev/null | fzf-tmux --reverse +m) &&
    cd $(ghq root)/$dir
}

# 時間の掛かるコマンドが終わったら通知 @see https://qiita.com/kei_s/items/96ee6929013f587b5878
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

if [[ -f ~/.zshrc.githubtoken ]]
then
  source ~/.zshrc.githubtoken
elif (( $+commands[brew] )); then
  # brew のある環境（Mac）でのみ通知する
  echo 'No GitHub token for homebrew found.'
  echo 'Go to https://github.com/settings/tokens and create token with public_repo scope.'
fi

if [[ -f ~/.zshrc.openaitoken ]]
then
  source ~/.zshrc.openaitoken
elif (( $+commands[brew] )); then
  echo 'No OPENAI token found.'
fi
# Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# Anacondaを使う場合には下記の行を有効にする
# __conda_setup="$('/Users/yousan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
# else
#    if [ -f "/Users/yousan/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/yousan/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/yousan/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# PHPENV （brew が入っている環境＝Mac でのみ設定する）
if (( $+commands[brew] )); then
  export PHP_RPATHS="$(brew --prefix bzip2)"
  #export PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2) --with-zip --enable-intl --with-pear"
  export PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-zip --enable-intl --with-pear"
fi
export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libedit/lib/pkgconfig:/usr/local/opt/libjpeg/lib/pkgconfig:/usr/local/opt/libpng/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/libzip/lib/pkgconfig:/usr/local/opt/oniguruma/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/tidy-html5/lib/pkgconfig"
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
#alias grep='/usr/local/opt/grep/libexec/gnubin/grep'

export PATH="$HOME/.phpenv/bin:$PATH"
(( $+commands[phpenv] )) && eval "$(phpenv init -)"

export PATH=$HOME/.nodenv/bin:$PATH
(( $+commands[nodenv] )) && eval "$(nodenv init -)"

# ruby for ubiteq d-drive
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/yousan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/yousan/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


## setting for wireshark to decrypt TLS
#export SSLKEYLOGFILE="~/Desktop/pre-master-secret.log"


# For Mac ports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"


# npm run コマンドの補完をカスタマイズ
function _npm_run_file_completion {
  local words cmd
  words=("${(Q)words[@]}")
  cmd=("${words[@]:1}")  # 最初の 'npm' を除外
  
  # `--spec` オプションの後にファイル補完を適用
  _arguments \
    '--spec:filename:_files'

  return 0
}

# `npm run` の補完をオーバーライド
compdef _npm_run_file_completion npm


# HOMEBREW 自動更新間隔を 24時間に設定
export HOMEBREW_AUTO_UPDATE_SECS="86400"

# Added by Antigravity
export PATH="/Users/yousan/.antigravity/antigravity/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ディレクトリごとに特定の操作を行う、direnv
# nvmでnodeのバージョンを書き換えるなど。

(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

# bun completions
[ -s "/home/yousan/.bun/_bun" ] && source "/home/yousan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# OpenClaw Completion
[ -f "$HOME/.openclaw/completions/openclaw.zsh" ] && source "$HOME/.openclaw/completions/openclaw.zsh"
export PATH="$HOME/.local/bin:$PATH"
