# shellcheck shell=bash
# yccli :: load balancers (network LB и application LB)

alias yclbl='yc load-balancer network-load-balancer list'
alias yclbtgl='yc load-balancer target-group list'

yclbg()  { yc load-balancer network-load-balancer get "$@"; }
yclbtgg(){ yc load-balancer target-group         get "$@"; }

alias ycalbl='yc application-load-balancer load-balancer list'
alias ycalbbgl='yc application-load-balancer backend-group list'
alias ycalbtgl='yc application-load-balancer target-group list'
alias ycalbhrl='yc application-load-balancer http-router list'

ycalbg()   { yc application-load-balancer load-balancer get "$@"; }
ycalbbgg() { yc application-load-balancer backend-group get "$@"; }
ycalbtgg() { yc application-load-balancer target-group  get "$@"; }
ycalbhrg() { yc application-load-balancer http-router   get "$@"; }
