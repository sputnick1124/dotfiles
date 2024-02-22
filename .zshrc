# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'option: %d'
zstyle ':completion:*:*:kill:*:processes' command 'ps xo pid,user:10,cmd | grep -v "sshd:|-zsh$"'
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+l:|=* r:|=*' 'r:|[._-/]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 0
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.zshrc'
fpath=($HOME/.config/zsh/ $fpath)
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' actionformats '%F{red}%b%f%F{yellow}|%F{red}%a%f '
zstyle ':vcs_info:*' formats '%F{blue}%c%u%b%f '
precmd () { vcs_info }
setopt PROMPT_SUBST

PS1='%F{yellow}%4~ ${vcs_info_msg_0_}%(?.%F{green}.%F{magenta})%(!.#.$)%f '

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt notify
bindkey -e
# End of lines configured by zsh-newuser-install

# complete from history on up/down arrow
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# move to beginning/end of line while remaining in insert mode
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line 

# Environment variables common to all setups
export XDG_CONFIG_HOME=$HOME/.config
export PAGER='less'
export GPG_TTY=$(tty)

if type nvim 2>&1 >/dev/null; then
    export EDITOR='nvim'
    alias vim='nvim'
    alias vimdiff='nvim -d'
    export MANPAGER='nvim +Man!'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.cargo/env ] && source ~/.cargo/env

type fnm 2>&1 >/dev/null && eval $(fnm env)

if type pandoc 2>&1 >/dev/null && type w3m 2>&1 >/dev/null; then
    function rmd() {
        pandoc -to html $1 | w3m -T text/html
    }
fi

if type bat 2>&1 >/dev/null; then
    alias cat='bat'
fi

export CMAKE_EXPORT_COMPILE_COMMANDS=ON
