!#/bin/sh

# Install packages

sudo pacman -Syu waybar hyprland foot ranger aerc kanata newsboat mako wofi zathura zathura-pdf-poppler rustup

cargo install kanata

# Make and enable services
sudo ln -s $HOME/Copernicus/systemd/kanata.service /etc/systemd/system/kanata.service

sudo systemctl enable kanata.service

# Make directories
mkdir -p $HOME/.config/
mkdir -p $HOME/.config/waybar/
mkdir -p $HOME/.config/waybar/scripts/

mkdir -p $HOME/.config/hypr/

mkdir -p $HOME/.config/foot/

mkdir -p $HOME/.config/ranger/

mkdir -p $HOME/.config/aerc/

mkdir -p $HOME/.config/kanata/

mkdir -p $HOME/.config/newsboat/

mkdir -p $HOME/.config/mako/

mkdir -p $HOME/.config/wofi/

mkdir -p $HOME/.config/zathura/

# Make links
ln -s $HOME/Copernicus/waybar/* $HOME/.config/waybar/
ln -s $HOME/Copernicus/waybar/scripts/* $HOME/.config/waybar/scripts/

ln -s $HOME/Copernicus/hypr/* $HOME/.config/hypr/

ln -s $HOME/Copernicus/starship.toml $HOME/.config/starship.toml

ln -s $HOME/Copernicus/foot.ini $HOME/.config/foot/foot.ini

ln -s $HOME/Copernicus/ranger/* $HOME/.config/ranger/

ln -s $HOME/Copernicus/bashrc $HOME/.bashrc

ln -s $HOME/Copernicus/aerc/* $HOME/.config/aerc/

ln -s $HOME/Copernicus/kanata/* $HOME/.config/kanata/

ln -s $HOME/Copernicus/newsboat/* $HOME/.config/newsboat/

ln -s $HOME/Copernicus/mako/* $HOME/.config/mako/

ln -s $HOME/Copernicus/wofi/* $HOME/.config/wofi/

ln -s $HOME/Copernicus/zathura/* $HOME/.config/zathura/
