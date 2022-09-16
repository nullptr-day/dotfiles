
## ------------------------------------------------------------------------------------------------
## Dotfiles config from scratch
## ------------------------------------------------------------------------------------------------

# git init --bare $HOME/.cfg
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# config config --local status.showUntrackedFiles no

## ------------------------------------------------------------------------------------------------
## Basic utils and libraries
## ------------------------------------------------------------------------------------------------

# basics
sudo apt install -y exa tree micro nnn
sudo apt install -y git ninja-build cmake
sudo apt install -y rofi nitrogen picom lxappearance gtk-chtheme
sudo apt install -y fonts-powerline fonts-font-awesome fonts-jetbrains-mono fonts-firacode
sudo apt install -y chromium-browser
sudo apt install -y libxcb-render0-dev libffi-dev
sudo apt install -y python3 python3-pip python3-tk python-dev python-cffi

# libs  for building stuff
sudo apt install -y pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev gzip
sudo apt install -y meson libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev
sudo apt install -y libxcb-util0-dev libxcb-icccm4-dev libyajl-dev
sudo apt install -y libstartup-notification0-dev libxcb-randr0-dev
sudo apt install -y libev-dev libxcb-cursor-dev libxcb-xinerama0-dev
sudo apt install -y libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
sudo apt install -y autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# bar
sudo pip install bumblebee-status
sudo pip install iw
sudo pip install netifaces
sudo pip install flashfocus

## ------------------------------------------------------------------------------------------------
## Alacritty
## ------------------------------------------------------------------------------------------------

cd /tmp
git clone https://github.com/alacritty/alacritty.git
cd alacritty
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env && rustup default nightly && rustup update
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty

## ------------------------------------------------------------------------------------------------
## Starship
## ------------------------------------------------------------------------------------------------

curl -sS https://starship.rs/install.sh | sh

## ------------------------------------------------------------------------------------------------
## i3-gaps
## ------------------------------------------------------------------------------------------------

cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
mkdir -p build && cd build
meson ..
ninja
sudo meson install
