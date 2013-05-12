function _user() {
    if [ ${UID} -eq 0 ]; then
    	echo -n "%B%F{red}%n"
    else
        echo -n "%B%F{green}%n"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}%K{black}%F{cyan}%D{%I:%M} $(_user)%B%F{blue}@%{%B%F{cyan}%}%m%{%B%F{green}%}:%{%b%F{yellow}%K{black}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
!%{%B%F{cyan}%}%!%{%f%k%b%} # '
