# shellcheck shell=bash
# yccli :: managed-kubernetes (clusters, node-groups, kubeconfig)

alias yck8sl='yc managed-kubernetes cluster list'
alias yck8sngl='yc managed-kubernetes node-group list'
alias yck8svl='yc managed-kubernetes list-versions'

yck8sg()    { yc managed-kubernetes cluster    get "$@"; }
yck8sngg()  { yc managed-kubernetes node-group get "$@"; }

# kubeconfig: одна команда вместо запоминания трёх флагов.
yck8scfg()  { yc managed-kubernetes cluster get-credentials --external "$@"; }
yck8scfgi() { yc managed-kubernetes cluster get-credentials --internal "$@"; }

# Узлы в кластере.
yck8snodes() { yc managed-kubernetes cluster list-nodes "$@"; }
