# Moving stuff out of $HOME
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export POWERLEVEL9K_CONFIG_FILE=$ZDOTDIR/.p10k.zsh


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $POWERLEVEL9K_CONFIG_FILE ]] || source $POWERLEVEL9K_CONFIG_FILE

[[ ! -f ~/code/zsh/zsh-config.sh ]] || source ~/code/zsh/zsh-config.sh


HISTSIZE=1000
if (( ! EUID )); then
  HISTFILE=$ZDOTDIR/.zsh_history_root
else
  HISTFILE=$ZDOTDIR/.zsh_history
fi
SAVEHIST=1000

# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
autoload -Uz compinit && compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION


zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select                              # Highlight menu selection

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Keybinds for substring history completion
bindkey '[[A' history-substring-search-up
bindkey '[[B' history-substring-search-down

bindkey '^[[3~' delete-char
bindkey '^H' backward-delete-word 

# Fixes for QMK grave escape 'escape' key
bindkey -s '^[[96;9u' '`'

