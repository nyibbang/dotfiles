# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

#compdef lab
function _lab_completion {
  local IFS=$'\n'

  # shellcheck disable=SC2207,SC2086,SC2154
  if echo ${words}"''" | xargs echo 2>/dev/null > /dev/null; then
    # shellcheck disable=SC2207,SC2086
    local c=($(echo ${words}"''" | xargs lab _carapace zsh _ ))
  elif echo ${words} | sed "s/\$/'/" | xargs echo 2>/dev/null > /dev/null; then
    # shellcheck disable=SC2207,SC2086
    local c=($(echo ${words} | sed "s/\$/'/" | xargs lab _carapace zsh _ ))
  else
    # shellcheck disable=SC2207,SC2086
    local c=($(echo ${words} | sed 's/$/"/'  | xargs lab _carapace zsh _ ))
  fi

  # shellcheck disable=SC2034,2206
  local vals=(${c%%$'\t'*})
  # shellcheck disable=SC2034,2206
  local descriptions=(${c##*$'\t'})

  local suffix=' '
  [[ ${vals[1]} == *$'\001' ]] && suffix=''
  # shellcheck disable=SC2034,2206
  vals=(${vals%%$'\001'*})

  compadd -l -S "${suffix}" -d descriptions -a -- vals
}
compquote '' 2>/dev/null && _lab_completion
compdef _lab_completion lab
