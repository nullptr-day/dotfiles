## ------------------------------------------------------------------------------------------------
## Basic utils and libraries
## ------------------------------------------------------------------------------------------------

cd $HOME

# basics
sudo apt install -y git kitty exa tree micro nnn
sudo apt install -y ninja-build cmake curl meson
sudo apt install -y rofi nitrogen picom lxappearance gtk-chtheme
sudo apt install -y fonts-powerline fonts-font-awesome fonts-jetbrains-mono fonts-firacode
sudo apt install -y chromium-browser
sudo apt install -y python3 python3-pip python3-tk

# libs  for building stuff
sudo apt install -y pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev gzip
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-render0-dev libffi-dev
sudo apt install -y libxcb-util0-dev libxcb-icccm4-dev libyajl-dev
sudo apt install -y libstartup-notification0-dev libxcb-randr0-dev
sudo apt install -y libev-dev libxcb-cursor-dev libxcb-xinerama0-dev
sudo apt install -y libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
sudo apt install -y autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# bar
pip install --user bumblebee-status
pip install --user iw
pip install --user netifaces
pip install --user flashfocus

## ------------------------------------------------------------------------------------------------
## Get the wallpapers
## ------------------------------------------------------------------------------------------------

git clone https://gitlab.com/dwt1/wallpapers.git .wallpapers

## ------------------------------------------------------------------------------------------------
## Starship
## ------------------------------------------------------------------------------------------------

cd $HOME
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

## ------------------------------------------------------------------------------------------------
## Get the dotfiles
## ------------------------------------------------------------------------------------------------

cd $HOME

git clone --bare https://github.com/nullptr-day/dotfiles.git $HOME/.cfg

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .config-backup
echo "Backing up pre-existing dot files.";
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

rm .bashrc

config checkout
config config status.showUntrackedFiles no

echo "Checked out config.";
