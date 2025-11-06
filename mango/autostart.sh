# Notification daemon
mako &

# Battery Warnings
batsignal -bpWCDFPU &

# Generate pywal colours
wal --theme "base16-gruvbox-hard" -i --cols16 ~/Photos/Wallpapers/ -n &

# Set wallpaper
swaybg -i ~/Photos/Wallpapers/current_wallpaper &

# Bar
waybar -c $XDG_CONFIG_HOME/mango/waybar/config.jsonc -s $XDG_CONFIG_HOME/mango/waybar/style.css &
