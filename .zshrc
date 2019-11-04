autoload -U colors && colors

# === COMPLETION ===
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# === HISTORY NAVIGATION ===
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# === HISTORY ===
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY

# === GIT ===
# Load version control information
autoload -Uz vcs_info
function precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{red}(%b%m%u%c)%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
# Untracked files (credit: https://stackoverflow.com/questions/49744179/zsh-vcs-info-how-to-indicate-if-there-are-untracked-files-in-git)
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -m 1 '^??' &>/dev/null
		then
			hook_com[misc]='?'
  	fi
}
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Replace '%#' with '%(!.#.>)' to have the '>' character
PROMPT='%F{yellow}%~%f${vcs_info_msg_0_} %F{blue}%#%f '

#macOS colorized 'ls'
export CLICOLOR=YES

# === ALIAS ===
#linuxS colorized 'ls'
#alias ls='ls --color'
alias ll='ls -l'
alias ..='cd ..'
alias grep='grep --color'
alias gst='git status'

# === PATH ===
export PATH="$HOME/bin:$PATH"
