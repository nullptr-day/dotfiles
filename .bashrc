### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export EDITOR="micro"                             # $EDITOR use nano in terminal
export VISUAL="micro"                             # $VISUAL use gedit in GUI mode
export MANPAGER="less"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PROMPT
# This is commented out if using starship prompt
# PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

### SETTING OTHER ENVIRONMENT VARIABLES
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### SHOPT
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASES ###

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"

##
# sudo apt install fish git exa tree
# sudo apt install fonts-jetbrains-mono
# sudo apt install lxappearance gtk-chtheme
# sudo apt install micro
# sudo apt install ninja-build
# sudo apt install polybar rofi nitrogen compton

### INITIAL CONFIG SETUP FROM SCRATCH
# git init --bare $HOME/.cfg
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# config config --local status.showUntrackedFiles no

# refresh font cache
# fc-cache -f -v

### Alacritty
# git clone https://github.com/alacritty/alacritty.git
# cd alacritty
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source $HOME/.cargo/env && rustup default nightly && rustup update
# sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 gzip
# cargo build --release
# sudo cp target/release/alacritty /usr/local/bin
# mkdir -p ~/.bash_completion
# cp extra/completions/alacritty.bash ~/.bash_completion/alacritty

### Starship
## curl -sS https://starship.rs/install.sh | sh
## - install Fira Code from https://www.nerdfonts.com/font-downloads

### i3-gaps
# sudo apt install meson
# sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
#                  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
#                  libstartup-notification0-dev libxcb-randr0-dev \
#                  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
#                  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
#                  autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# clone the repository
# git clone https://www.github.com/Airblader/i3 i3-gaps
# cd i3-gaps

# compile
# mkdir -p build && cd build
# meson ..
# ninja
# sudo meson install
. "$HOME/.cargo/env"
source ~/.bash_completion/alacritty
