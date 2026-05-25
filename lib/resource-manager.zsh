# shellcheck shell=bash
# yccli :: resource-manager (clouds, folders)

alias yccloudl='yc resource-manager cloud list'
alias ycfldl='yc resource-manager folder list'

yccloudg() { yc resource-manager cloud  get "$@"; }
ycfldg()   { yc resource-manager folder get "$@"; }
ycfldc()   { yc resource-manager folder create "$@"; }
