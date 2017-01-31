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
export EDITOR=nvim

# run the bash completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi

alias rm="rm -i"

# python related
export PIP_DOWNLOAD_CACHE=~/.virtualenv.cache

# add android platform tools
export PATH=~/src/android-sdk-macosx/platform-tools:$PATH
export ANDROID_HOME=~/src/android-sdk-macosx/

# fix unknown locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# setup bash completion and alias for sourcing virtual environemnts
source_virtualenv() {
    DIR=${1}
    if [ -z "${DIR}" ]; then
        echo ERROR: please input a virtualenv directory
        return 1
    fi
    source ~/virtualenv/${DIR}/bin/activate
}
_source_virtualenv_complete() {
    # refs http://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
    command=${1}
    word=${2}
    word_before=${3}

    COMPREPLY=( $( compgen -C "cd /Users/cheeming/virtualenv; echo ${word}*" 2> /dev/null ) )
}
complete -F _source_virtualenv_complete source_virtualenv
complete -F _source_virtualenv_complete s
alias s=source_virtualenv

# setup bash completion and alias for sourcing ssh-agent
ssha() {
    TYPE=${1}
    if [ -z "${TYPE}" ]; then
        echo ERROR: please input the NAME of the ssh-agent
        return 1
    fi
    source ~/Scripts/ssha-${TYPE}
    ssh-add -l
}
_source_ssh_agent_complete() {
    # refs http://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
    command=${1}
    word=${2}
    word_before=${3}
    if [ "${word_before}" == "ssha" ]; then
        COMPREPLY=( $( compgen -C "cd /Users/cheeming/Scripts; echo ssha-${word}*" 2> /dev/null | sed 's/ssha-//g' ) )
    fi
}
complete -F _source_ssh_agent_complete ssha

ssha-init() {
    TYPE=${1}
    ssha ${TYPE}
    ssh-add -D
    for FILE in `cat ~/Scripts/ssha-init.${TYPE}`; do
        ssh-add ${FILE}
    done
    ssh-add -l
}
complete -F _source_ssh_agent_complete ssha-init

# for node.js
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# for vim
alias vi=nvim
alias vim=nvim
alias vimdiff="vimdiff -c 'set diffopt+=iwhite'"

# git
alias ggrep="git grep --color"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias pathaws='export PATH=${PATH}:~/virtualenv/aws-cli/bin'
alias pathgo='export PATH=${PATH}:~/src/go-work/bin'

alias tb="nc termbin.com 9999"
