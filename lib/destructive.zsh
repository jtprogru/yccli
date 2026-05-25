# shellcheck shell=bash
# yccli :: destructive
#
# Этот файл подключается только если задан YCCLI_DESTRUCTIVE=1.
# Все алиасы здесь — обёртки с подтверждением. Используйте на свой страх и риск.

_yccli_confirm() {
  local prompt="${1:-Continue?}"
  if [[ -t 0 ]]; then
    print -n "${prompt} [y/N] "
    read -r ans
    [[ "$ans" == "y" || "$ans" == "Y" ]]
  else
    return 1
  fi
}

ycvmd()   { _yccli_confirm "Delete VM $*?"          && yc compute instance         delete "$@"; }
ycvmstop(){ _yccli_confirm "Stop VM $*?"            && yc compute instance         stop   "$@"; }
ycvmstart(){ yc compute instance start "$@"; }

ycdskd()  { _yccli_confirm "Delete disk $*?"        && yc compute disk             delete "$@"; }
ycnetd()  { _yccli_confirm "Delete network $*?"     && yc vpc network              delete "$@"; }
ycsubd()  { _yccli_confirm "Delete subnet $*?"      && yc vpc subnet               delete "$@"; }
ycsgd()   { _yccli_confirm "Delete security-group $*?" && yc vpc security-group    delete "$@"; }
ycsad()   { _yccli_confirm "Delete service account $*?" && yc iam service-account  delete "$@"; }
yck8sd()  { _yccli_confirm "Delete k8s cluster $*?" && yc managed-kubernetes cluster delete "$@"; }
ycfldd()  { _yccli_confirm "Delete folder $*?"      && yc resource-manager folder  delete "$@"; }
ycregd()  { _yccli_confirm "Delete registry $*?"    && yc container registry       delete "$@"; }
yclbxd()  { _yccli_confirm "Delete secret $*?"      && yc lockbox secret           delete "$@"; }
