#!/bin/zsh

PROMPT=$'%K{black}%F{yellow} %m %(?.%F{green}\uE0B1 \u2714.%F{red}\uE0B1 \u2718) %K{blue}%F{black}\ue0b0 %~ %K{black}%k%F{blue}\ue0b0%k%f '

RPROMPT=$'%F{blue}\uE0B2%K{blue}%F{black} %(?.\U1F667.%F{red}\U1F667) $(__git_ps1 "\ue0a0 %s ")%F{black}\uE0B2%k%f'
