###
# ~~ User Configuration
# ~~ Edit here
###

# Set ruby gems PATH
#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Set default prompt
#prompt redhat

# Load Syntax-Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set Aliases
alias ll="ls -FlAh --color=auto"
alias ls="ls -Flh --color=auto"
alias grep="grep --color=auto"
alias proc="ps -ef | grep $1"
alias x="exit "
#alias pacclear="sudo pacman -Rnsu $(pacman -Qqdt) && sudo pacman -Sc && sync"

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
 
