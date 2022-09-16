if status is-interactive

set -gx EDITOR nano
set -gx VISUAL gedit

### PATH
if test -d "$HOME/.bin"
  set -gx PATH "$HOME/.bin:$PATH"
end

if test -d "$HOME/.local/bin"
  set -gx PATH "$HOME/.local/bin:$PATH"
end

if test -d "$HOME/Applications"
  set -gx PATH "$HOME/Applications:$PATH"
end

function ex

  if test -f "$argv[1]"
    switch $argv[1]
      case '*.tar.bz2'
        tar xjf $argv[1]
      case '*.tar.gz'
         tar xzf $argv[1]
      case '*.bz2'
          bunzip2 $argv[1]
      case '*.rar'
          unrar x $argv[1]
      case '*.gz'
          gunzip $argv[1]
      case '*.tar'
           tar xf $argv[1]
      case '*.tbz2'
           tar xjf $argv[1]
      case '*.tgz'
           tar xzf $argv[1]
      case '*.zip'
           unzip $argv[1]
      case '*.Z'
           uncompress $argv[1]
      case '*.7z'
           7z x $argv[1]
      case '*.deb'
           ar x $argv[1];
      case '*.tar.xz'
           tar xf $argv[1]
      case '*.tar.zst'
           unzstd $argv[1]
      case '*'
           echo "'$argv[1]' cannot be extracted via ex()"
    end
  else
    echo "'$argv[1]' is not a valid file"
  end

end

### Aliases ###

# Changing "ls" to "exa"
alias ls="exa -al --color=always --group-directories-first" # my preferred listing
alias la="exa -a --color=always --group-directories-first"  # all files and dirs
alias ll="exa -l --color=always --group-directories-first"  # long format
alias lt="exa -aT --color=always --group-directories-first" # tree listing

# Colorize grep output (good for log files)
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps auxf | sort -nr -k 4"
alias pscpu="ps auxf | sort -nr -k 3"

# git
alias addup="git add -u"
alias addall="git add ."
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias commit="git commit -m"
alias fetch="git fetch"
alias pull="git pull origin"
alias push="git push origin"
alias stat="git status"  # 'status' is protected name so using 'stat' instead
alias tag="git tag"
alias newtag="git tag -a"

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

# use starship
starship init fish | source

end
