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
export GOPATH="${HOME}/gopath"
export PATH="${GOPATH}/bin:$PATH"
export PATH="${GOPATH}/src/gitlab.myteksi.net/gophers/go/scripts:$PATH"
export PATH="/usr/local/opt/go@1.16/bin:$PATH"

export GITLAB_REGISTRY_ACCESS_TOKEN=`cat ~/.gitlab_token`
export GRAB_GITLAB_ACCESS_TOKEN=`cat ~/.gitlab_token`

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PROTO_PATH=/usr/local/protoc
export PATH=$PATH:$PROTO_PATH/bin

# arcanist
export PATH=$PATH:/Users/cheeming.chew/arcanist/bin/

# mysql
export PATH=$PATH:/usr/local/opt/mysql@5.7/bin

# ruby
export PATH="/usr/local/opt/ruby/bin:${HOME}/.gem/ruby/2.6.0/bin:$PATH"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="/usr/local/opt/ruby@2.4/bin:$PATH"

[ -e ~/.grab_profile ] && source ~/.grab_profile
