# shellcheck shell=bash
# yccli :: compute (instances, disks, snapshots, images)

alias ycvml='yc compute instance list'
alias ycdskl='yc compute disk list'
alias ycimgl='yc compute image list'
alias ycsnapl='yc compute snapshot list'
alias yczonel='yc compute zone list'

ycvmg()    { yc compute instance  get "$@"; }
ycvmc()    { yc compute instance  create "$@"; }
ycvmssh()  { yc compute ssh "$@"; }
ycvmser()  { yc compute instance get-serial-port-output "$@"; }

ycdskg()   { yc compute disk     get "$@"; }
ycimgg()   { yc compute image    get "$@"; }
ycsnapg()  { yc compute snapshot get "$@"; }
