# shellcheck shell=bash
# yccli :: vpc (networks, subnets, security-groups, addresses, gateways)

alias ycnetl='yc vpc network list'
alias ycsubl='yc vpc subnet list'
alias ycsgl='yc vpc security-group list'
alias ycaddrl='yc vpc address list'
alias ycgwl='yc vpc gateway list'
alias ycrtl='yc vpc route-table list'

ycnetg()   { yc vpc network        get "$@"; }
ycsubg()   { yc vpc subnet         get "$@"; }
ycsgg()    { yc vpc security-group get "$@"; }
ycaddrg()  { yc vpc address        get "$@"; }
ycgwg()    { yc vpc gateway        get "$@"; }
ycrtg()    { yc vpc route-table    get "$@"; }
