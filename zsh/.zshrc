#!/bin/zsh

#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

### Scripts ###
# -- add additional programs to PATH --
PATH=$PATH:$HOME/scripts:$HOME/go/bin

### Completion ###
autoload -U compinit
compinit
# -- Advanced tab-completion --
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' menu select
# tip: TAB-TAB to move into the selection menu
# -- Correction --
setopt correctall

### History ###
HISTFILE=$HOME/.zsh_history		# previously it was zsh.d ( $MYZSHDIR )
HISTSIZE=3000
SAVEHIST=$HISTSIZE			# necessary to save history
setopt hist_ignore_all_dups		# ignore duplicates
setopt hist_ignore_space		# ignore space
setopt share_history			# save immediatelly, make history shareable between terminals

### Keys ###
# -- Kill & Yank --
bindkey -e				# for this set Emacs key bindings
# -- ctrl-left and ctrl-right --
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# -- del, home and end --
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
# -- Reverse search --
bindkey '^R' history-incremental-search-backward
# -- Remove C-d binding (list-choices/delete-char-or-list) --
bindkey -r '^D'				# instead use tab completion

### Miscellaneous settings ###
# -- Additional options --
setopt autocd				# directory name to change dir
setopt extendedglob
unsetopt beep				# do not beep
use_color=true
# -- Command Editor --
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
# -- Change the window title of X terminals --
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;${USER}@${HOST}:${PWD/#$HOME/\~}\a"};;
esac

### Theme ###
# -- Prompt Init --
autoload -U promptinit
promptinit
# -- git prompt --
setopt PROMPT_SUBST
. $MYZSHDIR/git-prompt.sh
# -- set themes --
if [[ -z $DISPLAY ]]; then
    . "$MYZSHDIR/tty.zsh-theme"       	# theme in tty
else
    . "$MYZSHDIR/emu.zsh-theme"      	# theme in emulators
fi

### Aliases ###
. $MYZSHDIR/aliases

### Plugins ###
# -- zsh-autosuggestions --
. $MYZSHDIR/zsh-autosuggestions.zsh
# -- syntax coloring --
. $MYZSHDIR/highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

### some fun stuff ###
# -- ls after changing directory --
chpwd() ls
