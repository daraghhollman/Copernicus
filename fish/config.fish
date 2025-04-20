if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ABBREVIATIONS
abbr --add gst git status
abbr --add ls exa
abbr --add ll exa -la

abbr --add ... "cd ..; cd .."
abbr --add .... "cd ..; cd ..; cd .."
abbr --add ..... "cd ..; cd ..; cd ..; cd .."

abbr --add diasvpn "sudo openvpn --config /home/daraghhollman/Main/Work/vpn/dhollman.ovpn"

abbr light "gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-dawn-gtk'"
abbr dark "gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk'"

abbr hss "hugo server --noHTTPCache"

abbr --add kepler_backup "rsync -a --delete --info=progress2 -v --exclude '.cache/' --exclude 'CacheStorage/' --exclude 'cache/' -e 'ssh -p 22001' /home/daraghhollman/ daraghhollman@79.97.106.33:/storage/kepler_backup/"

# YAZI
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set fish_greeting

starship init fish | source
zoxide init fish | source
thefuck --alias | source
pyenv init - fish | source
