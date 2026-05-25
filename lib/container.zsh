# shellcheck shell=bash
# yccli :: container registry (registries, repositories, images)

alias ycregl='yc container registry list'
alias ycrepol='yc container repository list'
alias ycimgrl='yc container image list'

ycregg()  { yc container registry   get "$@"; }
ycrepog() { yc container repository get "$@"; }
ycimgrg() { yc container image      get "$@"; }

# Сконфигурировать docker под Yandex Cloud credential helper.
alias ycregdocker='yc container registry configure-docker'
