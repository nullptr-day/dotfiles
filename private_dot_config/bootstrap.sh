#!/usr/bin/env bash

## ------------------------------------------------------------------------------------------------
## Basic utils and libraries
## ------------------------------------------------------------------------------------------------

cd $HOME

# basics
sudo apt install -y git kitty exa tree micro htop
sudo apt install -y ninja-build cmake curl meson
sudo apt install -y fonts-powerline fonts-font-awesome fonts-jetbrains-mono fonts-firacode
sudo apt install -y python3 python3-pip python3-tk

# libs  for building stuff
sudo apt install -y pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev gzip
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-render0-dev libffi-dev
sudo apt install -y libxcb-util0-dev libxcb-icccm4-dev libyajl-dev
sudo apt install -y libstartup-notification0-dev libxcb-randr0-dev libreadline-dev
sudo apt install -y libev-dev libxcb-cursor-dev libxcb-xinerama0-dev
sudo apt install -y libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
sudo apt install -y autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

## ------------------------------------------------------------------------------------------------
## Starship
## ------------------------------------------------------------------------------------------------

cd $HOME
curl -sS https://starship.rs/install.sh | sh

## ------------------------------------------------------------------------------------------------
## Compile and install nnn
## ------------------------------------------------------------------------------------------------

cd $HOME
git clone https://github.com/jarun/nnn.git
cd nnn
git checkout tags/v4.6
sudo make O_EMOJI=1 O_GITSTATUS=1
cp nnn $HOME/.local/bin/
cd $HOME
rm -rf nnn

# get the plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

## ------------------------------------------------------------------------------------------------
## Get and install jump
## ------------------------------------------------------------------------------------------------

cd $HOME
wget https://github.com/gsamokovarov/jump/releases/download/v0.51.0/jump_0.51.0_amd64.deb 
sudo dpkg -i jump_0.51.0_amd64.deb
rm jump_0.51.0_amd64.deb

## ------------------------------------------------------------------------------------------------
## Get the dotfiles
## ------------------------------------------------------------------------------------------------

# TODO
