shopt -s histappend
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'
export HISTSIZE=100000
export HISTFILESIZE=100000

# for brew
export PATH="/usr/local/sbin:$PATH"

# for autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# setup vim as default editor
export EDITOR=vim

# run the bash completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi

alias rm="rm -i"

# fix unknown locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# for vim
alias vi=vim
alias vim=vim
alias vimdiff="vimdiff -c 'set diffopt+=iwhite'"

# git
alias ggrep="git grep --color"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#eval "$(direnv hook bash)"

export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/

# setup GO
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:$PATH"
export PATH="/usr/local/opt/go@1.9/bin:$PATH"

export GITLAB_REGISTRY_ACCESS_TOKEN=`cat ~/.gitlab_token`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/opt/openssl/bin:$PATH"
