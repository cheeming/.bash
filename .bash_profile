shopt -s histappend
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'
export HISTSIZE=100000
export HISTFILESIZE=100000

# fix unknown locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# for brew
export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/opt/go@1.21/bin:$PATH"

# for autojump
#[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# setup vim as default editor
export EDITOR=nvim
# for vim
alias vi=nvim
alias vim=nvim
alias vimdiff="nvim -d -c 'set diffopt+=iwhite'"

# run the bash completion
#if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
#    source /usr/local/etc/bash_completion.d/git-completion.bash
#fi

alias rm="rm -i"

# python related
export PIP_DOWNLOAD_CACHE=~/.virtualenv.cache

# ruby related
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# aws related
export PATH="/opt/aws/aws-cli/:$PATH"

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
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# git
alias ggrep="git grep --color"
