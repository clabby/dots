#!/bin/sh

if [ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]; then
  thm_fg="#d8d0c0"
  thm_fg_muted="#b0a898"
  thm_gray="#706C61"
  thm_coral="#E08060"
else
  thm_fg="#282418"
  thm_fg_muted="#585040"
  thm_gray="#989080"
  thm_coral="#b84c30"
fi

FZF_COLOR="bg:-1,fg:${thm_fg},hl:${thm_coral},fg+:${thm_fg},bg+:${thm_gray},hl+:${thm_coral},prompt:${thm_coral},pointer:${thm_coral},header:${thm_fg_muted}"
