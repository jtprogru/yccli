# shellcheck shell=bash
# yccli :: core
# Базовые команды yc CLI: init, version, components, whoami, конфиг и профили.

alias yci='yc init'
alias ycif='yc init --federation-id'
alias ycv='yc version'
alias ycu='yc components update'
alias ycw='yc iam whoami'

alias yccl='yc config list'
alias yccg='yc config get'
alias yccs='yc config set'

alias ycpl='yc config profile list'
alias ycpg='yc config profile get'

# Активация профиля принимает аргумент — реализуем функцией, чтобы completion
# работал и аргумент не «прилипал» к алиасу.
ycpa() { yc config profile activate "$@"; }
ycpc() { yc config profile create "$@"; }
ycpd() { yc config profile delete "$@"; }

# Установить folder/cloud в активном профиле — частая операция.
yc-folder-set() { yc config set folder-id "$@"; }
yc-cloud-set()  { yc config set cloud-id  "$@"; }

# Показать текущий активный профиль (имя).
yc-profile-current() {
  yc config profile list 2>/dev/null | awk '/ACTIVE/{next} /\*/{print $1}'
}
