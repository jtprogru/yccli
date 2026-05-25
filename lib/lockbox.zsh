# shellcheck shell=bash
# yccli :: lockbox (secrets, payload)

alias yclbxl='yc lockbox secret list'

yclbxg()    { yc lockbox secret  get          "$@"; }
yclbxc()    { yc lockbox secret  create       "$@"; }
yclbxvl()   { yc lockbox secret  list-versions "$@"; }
yclbxpay()  { yc lockbox payload get          "$@"; }
