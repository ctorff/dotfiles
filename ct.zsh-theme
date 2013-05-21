function _user() {
    if [ ${UID} -eq 0 ]; then
    	echo -n "%B%F{red}%n"
    else
        echo -n "%B%F{green}%n"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%b%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}%K{black}%F{white}%D{%I:%M} $(_user)%b%K{black}%F{white}@%{%B%F{white}%}%m %{%{%b%F{yellow}%K{black}%}%~%{%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
!%{%B%F{grey}%}%!%{%f%k%b%} # '
