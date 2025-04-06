
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export BROWSER=firefox

# Append to history
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

### ALIASES ###
# General
alias grep='grep --color=auto'
alias ranger=". ranger"
alias ls="exa"
alias ll="exa -la"

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias .....='cd ..; cd ..; cd ..; cd ..;'

# Git
alias gst='git status'

# Scripts
alias yt='yt-dlp --add-metadata -i'
alias yta='yt -x -f bestaudio/best'
alias paper="python ~/Main/Projects/NowADS/nowADS.py"
alias fetch="/home/daraghhollman/Main/scripts/infoDisplay.sh"
alias kepler_backup="rsync -a --delete --info=progress2 -v --exclude '.cache/' -e 'ssh -p 22001' /home/daraghhollman/ daraghhollman@79.97.106.33:/storage/kepler_backup/"

# Software
alias fnv='nvim $(fzf --preview="bat --color=always {}")'
alias hss='hugo server --noHTTPCache'

# View vimwiki
alias vimwiki="$BROWSER /home/daraghhollman/Main/vim_wiki_html/index.html"

# Other
alias diasvpn="sudo openvpn --config /home/daraghhollman/Main/Work/vpn/dhollman.ovpn"

# Appearance
alias light="gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-dawn-gtk'"
alias dark="gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk'"

eval "$(starship init bash)"
eval "$(thefuck --alias)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"


### FUNCTIONS ###
# Open pdfs
ReadPDF() {
    pdftotext -layout "$1" - | less
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

### CLEANUP ###
export R_LIBS_USER="/home/daraghhollman/.r/"
export XDG_CONFIG_HOME="$HOME/.config/"
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export W3M_DIR="$XDG_STATE_HOME/w3m" 
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias mbsync='mbsync -c ~/.mbsyncrc'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export GOPATH="$XDG_DATA_HOME"/go
#export RUSTUP_HOME=~/.

# bun
export BUN_INSTALL="$HOME/.bun"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

### PATH ###
export PATH="$HOME/Main/scripts:$PATH"
export PATH="$HOME/Main/scripts/tmux:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="$HOME/Main/Installations/jabref/build/image/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"

exec fish
