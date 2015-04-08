export BYOBU_PYTHON='/usr/bin/env python'
#export PATH=/Users/lauren/byobu/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin
export PATH=/Users/lauren/byobu/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

set completion-ignore-case on
set show-all-if-ambiguous on

# add auto complete for git
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

## --- emacs ---
alias emacs=“/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs”
# start a windowed frame
alias ec ='/Applications/MacPorts/Emacs.app/Contents/MacOS/bin/emacsclient -n -c -a /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs'
