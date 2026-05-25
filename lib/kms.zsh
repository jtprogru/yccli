# shellcheck shell=bash
# yccli :: kms (symmetric keys & crypto)

alias yckmsl='yc kms symmetric-key list'

yckmsg()  { yc kms symmetric-key get    "$@"; }
yckmsc()  { yc kms symmetric-key create "$@"; }
yckmsrot(){ yc kms symmetric-key rotate "$@"; }

# Шифрование/дешифрование данных одним вызовом.
yckmsenc() { yc kms symmetric-crypto encrypt "$@"; }
yckmsdec() { yc kms symmetric-crypto decrypt "$@"; }
