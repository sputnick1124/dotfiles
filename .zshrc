# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'option: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+l:|=* r:|=*' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 0
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*:processes' command 'ps xo pid,user:10,cmd | grep -v "sshd:|-zsh$"'
zstyle :compinstall filename '$HOME/.zshrc'

fpath=($HOME/.config/zsh/ $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1500
SAVEHIST=1500
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install

# complete from history on up/down arrow
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# move to beginning/end of line while remaining in insert mode
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line 

# Environment variables common to all setups
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR='vim'
export PAGER='less -F'
export GPG_TTY=$(tty)
#alias vim='vim --servername vim'
export TERM='xterm-256color'

# machine-specific env settings are kept separate for easier management with yadm alternates
source $HOME/.config/zsh/local.zsh
# nice, self-contained config from subnixr/minimal (with some modifications)
source $HOME/.config/zsh/minimal.zsh

