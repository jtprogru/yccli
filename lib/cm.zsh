# shellcheck shell=bash
# yccli :: certificate-manager

alias yccertl='yc certificate-manager certificate list'

yccertg()       { yc certificate-manager certificate get     "$@"; }
yccertcontent() { yc certificate-manager certificate content "$@"; }
yccertreq()     { yc certificate-manager certificate request "$@"; }
