#!/bin/zsh

# ~/.zshrc

#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|

# ----- setting the path -----
# !!!!! WARNING !!!!!
# this is important for
# themes, highlighting and suggestions
MYZSHDIR="$HOME/zsh.d"
if [[ ! -x $MYZSHDIR ]]; then; echo "Warning! no $MYZSHDIR found!"; fi

# --- Scripts ---
# add my scripts and go programs to PATH
PATH=$PATH:$HOME/scripts:$HOME/go/bin

# --- Completion ---
autoload -U compinit
compinit

# --- Advanced tab-completion ---
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' menu select
# -- tip: TAB-TAB to move into the selection menu

# --- Correction ---
setopt correctall

# --- Prompt Init ---

autoload -U promptinit
promptinit
#prompt gentoo				# use when you do not have your own prompt theme

# --- History ---
HISTFILE=$HOME/zsh_history		# previously it was zsh.d ( $MYZSHDIR )
HISTSIZE=3000
SAVEHIST=$HISTSIZE			# necessary to save history
setopt hist_ignore_all_dups		# ignore duplicates
setopt hist_ignore_space		# ignore space
setopt share_history			# save immediatelly, make history shareable between terminals
#setopt inc_append_history		# don't use with "share_history"

# --- Keys ---
# -- ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# -- del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
# -- Reverse search
bindkey '^R' history-incremental-search-backward

# --- Miscellaneous settings ---
setopt autocd				# directory name to change dir
setopt extendedglob
use_color=true
# -- Command Editor --
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
# -- File Editor --
EDITOR=vim

# --- Change the window title of X terminals ---
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;${USER}@${HOST}:${PWD/#$HOME/\~}\a"};;
esac

# --- Theme ----
# -- git prompt
setopt PROMPT_SUBST
. $MYZSHDIR/git-prompt.sh
# -- source themes
if [[ -z $DISPLAY ]]; then
    . "$MYZSHDIR/neos.zsh-theme"       	# theme in tty
else
    . "$MYZSHDIR/hardX.zsh-theme"      	# theme in emulators
fi

# --- Aliases ---
. $MYZSHDIR/aliases

# --- zsh-autosuggestions ---
. $MYZSHDIR/zsh-autosuggestions.zsh

# --- syntax coloring ---
. $MYZSHDIR/highlighting/zsh-syntax-highlighting.zsh

# --- some fun stuff ---
# -- larrysay --
if [ -x /usr/bin/cowsay -a -x /usr/bin/fortune -a -x /usr/bin/lolcat -a -x /usr/bin/portageq ]; then
    {fortune | cowsay -f $MYZSHDIR/larry.cow;
    zsh --version} | lolcat 
fi
# -- check the characte's unicode encoding --
codepoints () { printf 'U+%04x\n' ${@/#/\'} ; }
