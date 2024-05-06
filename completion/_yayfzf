#compdef yayfzf

_yayfzf() {
  local -a args

  args=(
    '-h:Show the help menu'
    '--help:Show the extended help menu of yayfzf'
    '-k:List keybindings for yayfzf'
    '--keybindings:List keybindings for yayfzf'
    '-V:Show version of yayfzf'
    '--version:Show version of yayfzf'
  )

  _arguments -C \
    "${args[@]}" \
    ':query:_files'
}

_yayfzf "$@"
