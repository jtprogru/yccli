# shellcheck shell=bash
# yccli :: iam (service-accounts, keys, roles)

alias ycsal='yc iam service-account list'
alias yckeyl='yc iam key list'
alias ycrolel='yc iam role list'

ycsag() { yc iam service-account get    "$@"; }
ycsac() { yc iam service-account create "$@"; }
ycsau() { yc iam service-account update "$@"; }

yckeyg() { yc iam key get    "$@"; }
yckeyc() { yc iam key create "$@"; }

ycroleg() { yc iam role get "$@"; }

# Создать access-key / api-key для сервис-аккаунта (часто нужно).
ycsakey-access() { yc iam access-key create --service-account-id "$@"; }
ycsakey-api()    { yc iam api-key    create --service-account-id "$@"; }
ycsakey-iam()    { yc iam key        create --service-account-id "$@"; }

# IAM-токен в STDOUT — удобно для CI/скриптов.
alias yctoken='yc iam create-token'
