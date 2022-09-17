# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# use micro as text editor
export EDITOR="/usr/bin/micro"
export VISUAL="/usr/bin/micro"

# nnn configuration
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_FCOLORS='0000E6310000000000000000'
export NNN_PLUG='p:preview-tui'
