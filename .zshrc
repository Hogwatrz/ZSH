# Disable Powerlevel10k instant prompt cleanly
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation (optional if not using oh-my-zsh)
export ZSH="$HOME/.oh-my-zsh"

# Preferred editor
export EDITOR='nano'

# Use Powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Enable command autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Declare styles as associative array
typeset -A ZSH_HIGHLIGHT_STYLES

# Disable underlines across all highlight types
ZSH_HIGHLIGHT_STYLES[command]='none'
ZSH_HIGHLIGHT_STYLES[builtin]='none'
ZSH_HIGHLIGHT_STYLES[function]='none'
ZSH_HIGHLIGHT_STYLES[alias]='none'
ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'

# Enable syntax highlighting (must come last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable completion system
autoload -Uz compinit
compinit

# Load fzf-tab plugin
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# Enable icons in fzf-tab
zstyle ':fzf-tab:*' fzf-preview 'echo {}'  # basic preview
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -l --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --ansi
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Enable grouping
zstyle ':fzf-tab:*' group-colors $'\033[1;34m' $'\033[0;32m'

# Display descriptions with completions (like git branches, options, etc.)
zstyle ':completion:*' format $'\033[1;33mCompleting %d...\033[0m'

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history

# Use modern command correction and autocd
setopt correct
setopt autocd
setopt extended_glob
setopt prompt_subst

# Aliases
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'
alias yaysync='yay -Syu --noconfirm'

# Prompt Powerlevel10k (optional if you already created ~/.p10k.zsh)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fastfetch
