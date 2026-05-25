# shellcheck shell=bash
# yccli :: storage (Object Storage buckets)

alias ycs3l='yc storage bucket list'

ycs3g()    { yc storage bucket get   "$@"; }
ycs3c()    { yc storage bucket create "$@"; }
ycs3stat() { yc storage bucket stats "$@"; }
