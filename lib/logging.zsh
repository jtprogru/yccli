# shellcheck shell=bash
# yccli :: logging (log groups, read/write)

alias yclogl='yc logging group list'

yclogg()    { yc logging group get   "$@"; }
yclogc()    { yc logging group create "$@"; }
yclogstat() { yc logging group stats "$@"; }
yclogread() { yc logging read        "$@"; }
yclogwrite(){ yc logging write       "$@"; }
