# shellcheck shell=bash
# yccli :: dns (zones, records)

alias ycdnsl='yc dns zone list'

ycdnsg()   { yc dns zone get          "$@"; }
ycdnsrl()  { yc dns zone list-records "$@"; }
ycdnsra()  { yc dns zone add-records  "$@"; }
ycdnsrd()  { yc dns zone delete-records "$@"; }
