#
# ~/.bashrc
#

# DOFILES SETUP + AUTOCOMPLETE FOR ALIAS
source /usr/share/bash-completion/completions/git
__git_complete dotfiles __git_main

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Append to history
shopt -s histappend


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### ALIASES ###
# General

alias bemenu='bemenu-style'

alias grep='grep --color=auto'
alias ranger=". ranger"
alias ls="exa"
alias ll="exa -la"

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias .....='cd ..; cd ..; cd ..; cd ..;'

# Scripts
alias yt='yt-dlp --add-metadata -i'
alias yta='yt -x -f bestaudio/best'
alias clear='clear && echo; /home/daraghhollman/Main/scripts/generateFetchPrompt.sh; neofetch --config /home/daraghhollman/.config/neofetch/bashrc_conf.conf'
alias paper="python ~/Main/Projects/NowADS/nowADS.py"
alias fetch="/home/daraghhollman/Main/scripts/infoDisplay.sh"
alias backup="sudo rsync -auP --delete /home/daraghhollman/ /run/media/daraghhollman/SanDisk-Daragh/Copernicus_Home/"
alias onlineBackup='read -s -p "Remote sudo password: " SUDOPASS && rsync -auP --delete --stats --rsync-path="echo $SUDOPASS | sudo -Sv && sudo rsync" /home/daraghhollman/ daraghhollman@192.168.0.73:/media/root/Backups/Copernicus_Home/'

# Virual Environments
alias jupt_testing="source ~/Main/envs/jupt_testing/bin/activate"
alias cometPy="source /home/daraghhollman/Main/CometsThesis/Python/cometPy/bin/activate"
alias mupt="source ~/Main/envs/mupt/bin/activate"

# Software
alias fnv='nvim $(fzf --preview="bat --color=always {}")'
alias aurora="cd /home/daraghhollman/Installations/Aurora4x/Aurora/; FONT_NAME="FreeSerif" FONT_SIZE=9 SCALEHACKX=1 SCALEHACKY=1 MONO_IOMAP=all mono Aurora.exe"
alias hss='hugo server --noHTTPCache'

# Navigation
alias comets="cd /home/daraghhollman/Main/CometsThesis/; source ./Python/cometPy/bin/activate"
alias thesis="cd /home/daraghhollman/Main/CometsThesis/Writing/Thesis; evince main.pdf & nvim ./main.tex"
alias spade="cd /home/daraghhollman/Main/Projects/SPADE/; source /home/daraghhollman/Main/envs/spade_testing/bin/activate"
alias website="cd /home/daraghhollman/Main/Projects/personal/daraghhollman.github.io/; nvim index.html"

# Other
alias pylint="pylint --rcfile /home/daraghhollman/.config/pylintrc"

### FUNCTIONS ###
# Open pdfs
ReadPDF() {
    pdftotext -layout "$1" - | less
}


### OTHER ###
eval "$(starship init bash)"
eval "$(thefuck --alias)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

### CLEANUP ###
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

### PATH ###
export PATH="$HOME/Main/scripts:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="$HOME/Main/Installations/jabref/build/image/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH=$BUN_INSTALL/bin:$PATH
