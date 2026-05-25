# shellcheck shell=bash
# yccli :: serverless (functions, containers, triggers, api-gateway)

alias ycfnl='yc serverless function list'
alias ycctrl='yc serverless container list'
alias yctrgl='yc serverless trigger list'
alias ycapigwl='yc serverless api-gateway list'

ycfng()      { yc serverless function    get  "$@"; }
ycfninvoke() { yc serverless function    invoke "$@"; }
ycfnlog()    { yc serverless function    logs "$@"; }

ycctrg()     { yc serverless container   get "$@"; }
yctrgg()     { yc serverless trigger     get "$@"; }
ycapigwg()   { yc serverless api-gateway get "$@"; }
