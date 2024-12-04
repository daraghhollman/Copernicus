# Install packages
echo "Installing packages"

sudo pacman -Syu wayland waybar hyprland foot ranger aerc newsboat mako wofi zathura zathura-pdf-poppler neovim cronie tree-sitter npm dotnet-sdk unzip ttf-nerd-fonts-symbols starship thefuck zoxide fzf exa swww network-manager-applet blueman firefox thunar htop hypridle hyprlock pavucontrol pass wl-clipboard wev man pamixer brightnessctl qt5-wayland qt6-wayland batsignal udiskie nwg-displays gvfs slurp swappy grim tmux

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && sudo rm -rf yay/

yay -S ttf-courier-prime

sudo npm install -g tree-sitter-cli

# Make directories
echo "Making directories"

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

mkdir -p $HOME/.config/nvim/

mkdir -p $HOME/.config/mako/icons

# Make links
echo "Creating symlinks"

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

ln -s $HOME/Copernicus/nvim/* $HOME/.config/nvim/

ln -s $HOME/Copernicus/mako/icons/* $HOME/.config/mako/icons/

ln -s $HOME/Copernicus/tmux.conf $HOME/.tmux.conf

# Set up crontabs
echo "Adding cron jobs"

(crontab -l 2>/dev/null; echo "*/20 * * * * /usr/bin/newsboat -x reload") | crontab -

# Systemd services
echo "Enabling services"

sudo systemctl enable bluetooth
