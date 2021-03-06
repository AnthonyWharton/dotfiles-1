# Path to the bash it configuration
export BASH_IT="/home/raef/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh

export EDITOR='vim'
export VISUAL='vim'

PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

function ssh() {
    case $1 in
        bcp4 ) ssh rc15129@snowy.cs.bris.ac.uk -t "ssh rc15129@bc4login.acrc.bris.ac.uk" ;;
        bcp4-direct ) ssh rc15129@bc4login.acrc.bris.ac.uk ;;
        * ) command ssh $@ ;;
    esac
}

function git() {
    case $1 in
        ls ) git log --all --graph --decorate --pretty=format:"%Cblue%an%Cred%d%Creset%n%s%n" ;;
        * ) command git $@ ;;
    esac
}

function cal() {
	if [ "$1" == "" ]
		then
			khal calendar now
		else
			khal calendar $1
	fi
}

alias xclip="xclip -selection c"
alias dup="gnome-terminal ."
alias mail-archive="mail -f ~/Mail/mail.mbox"

function open() {
    #do things with parameters like $1 such as
    xdg-open "$1" &>/dev/null &
}

export QT_QPA_PLATFORMTHEME=gtk2

set -o vi

dbus-update-activation-environment --all

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null
