###
# ~~ User Configuration
# ~~ Edit here
###

# Set ruby gems PATH
#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Force colour
export TERM=xterm-256color

# Load Syntax-Highlighting
if [ -f '/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh' ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

# Load broot config
if [ "$(command -v br)" ]; then
    source /home/nick/.config/broot/launcher/bash/br
    unalias -m 'tr'
    alias tr='br'
fi

# Set Aliases
if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto -a -s type'
    alias ll='exa -l --color always -a -s type'
fi

alias grep='grep --color=auto'
alias x='exit '
alias proc= "ps -ef | grep {$1}"
alias listcmd='echo "find - fd, grep - rg, tree - br, cat - bat, ps - procs, yay - paru"'

#Export path variables
#export 'PATH="$PATH:/root/.local/bin"'

# Generate Random Password
genpasswd() {
    local INPUT=$1
        [ "$INPUT" == "" ] && l=16
        tr -dc A-Za-z0-9 < /dev/urandom | head -c ${INPUT} | xargs
}

# Extended ping command
pingim() {
    local INPUT=$1
    ping -c 1000 -i 1 -vO -s 504 $INPUT | while read PING; do echo "$(date +%d.%m.%Y-%H:%M:%S): $PING" 2>&1 ; done
}

# Set starship prompt
if [ "$(command -v starship)" ]; then
    eval "$(starship init zsh)" 
fi
