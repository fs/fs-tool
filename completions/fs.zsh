if [[ ! -o interactive ]]; then
    return
fi

compctl -K _fs fs

_fs() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(fs commands)"
  else
    completions="$(fs completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
