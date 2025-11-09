
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if there is none yet
if [ ! -d $ZINIT_HOME ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi	

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load starship (maybe it's a good idea to dynamically install starship if it's not installed, but that's a problem for future me uwu)
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# Load syntax highlighting 
zinit load zsh-users/zsh-syntax-highlighting

# Load autocomplete
zinit load zsh-users/zsh-completions
autoload -U compinit && compinit

# Load auto suggestions so i don't bash my head in trying to access vim with tab
zinit load zsh-users/zsh-autosuggestions

# Load ohmyzsh plugin snippets
zinit snippet OMZP::sudo

# Load fzf
eval "$(fzf --zsh)"

# ZSH settings
HISTSIZE=150
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Export variables
export LS_COLORS="di=1;35:fi=0;37:ln=36:pi=33:so=32:bd=48;5;214;38;5;16:cd=48;5;214;38;5;16:or=31;48;5;214"
export EDITOR="nvim"

# Aliases
alias ls='ls --color'
alias fzfe='nvim $(fzf)'

export PATH="/home/dominick/.bin:$PATH:/home/dominick/.cargo/bin"


fastfetch

# For startup time or sum shit, idrk what this does 🤷🏻‍♂️
zinit cdreplay -q

alias claude="/home/dominick/.claude/local/claude"
