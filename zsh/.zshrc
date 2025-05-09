# Path setup
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Zsh options
setopt autocd               # Change directories just by typing their name
setopt correct              # Suggest corrections for mistyped commands
setopt hist_ignore_dups     # Don’t record duplicate commands in history
setopt share_history        # Share command history across terminals

# History config
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Prompt (simple and readable)
autoload -Uz promptinit && promptinit
prompt off  # Turn off default prompt themes
bindkey -v # vim mode

# Custom PS1 prompt
PROMPT='%F{cyan}%n@%m%f:%F{yellow}%~%f %# '

# Aliases
alias ls='ls --color'
alias ll='ls -lh --color'
alias la='ls -A --color'
alias l='ls -CF --color'

# Completion system
autoload -Uz compinit && compinit

# Plugins (install these manually in ~/.zsh)
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi



function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    PROMPT='%B%F{magenta} < %f%b'  # Modalità normale
  else
    PROMPT='%B%F{magenta} > %f%b'  # Modalità inserimento
  fi
  zle reset-prompt  # Forza l'aggiornamento del prompt
}

function zle-line-init {
  zle-keymap-select  # Assicura che il prompt sia corretto all’inizio
}

# Collega le funzioni agli eventi ZLE
zle -N zle-keymap-select
zle -N zle-line-init