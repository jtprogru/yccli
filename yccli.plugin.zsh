# yccli — zsh-плагин с алиасами и helper-функциями для Yandex Cloud CLI.
#
# Author:  Mikhail Savin <jtprogru@gmail.com>
# Repo:    https://github.com/jtprogru/yccli
# License: MIT
# Tested:  yc 1.10.0 (см. .yc-version)
#
# Конфигурация через переменные окружения (см. docs/configuration.md):
#   YCCLI_DISABLE_GROUPS   список групп через пробел, которые НЕ грузить
#                          (имена файлов из lib/ без префикса и расширения).
#                          Пример: YCCLI_DISABLE_GROUPS="serverless managed-db"
#   YCCLI_REQUIRE_YC       если =1, плагин падает с ошибкой при отсутствии yc.
#                          По умолчанию (0) — тихо выходит, не ломая шелл.
#   YCCLI_DESTRUCTIVE      если =1, грузит lib/destructive.zsh (удаления и т.п.).
#   YCCLI_ENABLE_COMPLETION если =1, подгружает zsh-completion из `yc completion zsh`
#                          с кэшированием в $YCCLI_CACHE_DIR.
#   YCCLI_CACHE_DIR        каталог для кэша completion. По умолчанию:
#                          ${XDG_CACHE_HOME:-$HOME/.cache}/yccli
#   YCCLI_VERSION_WARN     если =1, при загрузке плагин сравнит `yc version`
#                          с .yc-version и предупредит при mismatch.

# Идемпотентность: повторный source не должен дублировать ничего.
if [[ -n "${_YCCLI_LOADED:-}" ]]; then
  return 0
fi
typeset -g _YCCLI_LOADED=1

# Определяем каталог плагина (работает и в oh-my-zsh, и в zinit, и при manual source).
typeset -g YCCLI_DIR="${${(%):-%x}:A:h}"

# Проверка наличия `yc` в PATH.
if ! command -v yc >/dev/null 2>&1; then
  if [[ "${YCCLI_REQUIRE_YC:-0}" == "1" ]]; then
    print -u2 "yccli: 'yc' not found in PATH (YCCLI_REQUIRE_YC=1)."
    return 1
  fi
  # тихо выходим — пользователь, видимо, ещё не поставил yc
  return 0
fi

# Загрузка модулей. Каждый модуль = lib/<group>.zsh.
# YCCLI_DISABLE_GROUPS управляет тем, какие модули пропустить.
typeset -ga _yccli_modules=(
  _core
  resource-manager
  iam
  compute
  vpc
  kms
  k8s
  serverless
  storage
  dns
  container
  lb
  cm
  lockbox
  logging
  managed-db
)

typeset -a _yccli_disabled
_yccli_disabled=(${=YCCLI_DISABLE_GROUPS:-})

for _mod in "${_yccli_modules[@]}"; do
  # пропуск отключённых
  if (( ${_yccli_disabled[(I)$_mod]} )); then
    continue
  fi
  if [[ -r "${YCCLI_DIR}/lib/${_mod}.zsh" ]]; then
    source "${YCCLI_DIR}/lib/${_mod}.zsh"
  fi
done
unset _mod _yccli_disabled

# Деструктивные обёртки только по явному запросу.
if [[ "${YCCLI_DESTRUCTIVE:-0}" == "1" && -r "${YCCLI_DIR}/lib/destructive.zsh" ]]; then
  source "${YCCLI_DIR}/lib/destructive.zsh"
fi

# Опциональная подгрузка completion от самого `yc`.
if [[ "${YCCLI_ENABLE_COMPLETION:-0}" == "1" ]]; then
  typeset -g YCCLI_CACHE_DIR="${YCCLI_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/yccli}"
  [[ -d "$YCCLI_CACHE_DIR" ]] || mkdir -p "$YCCLI_CACHE_DIR"
  local _yc_completion="${YCCLI_CACHE_DIR}/yc-completion.zsh"
  # перегенерация, если кэш старше бинарника yc
  if [[ ! -s "$_yc_completion" ]] || [[ "$(command -v yc)" -nt "$_yc_completion" ]]; then
    yc completion zsh >| "$_yc_completion" 2>/dev/null || :
  fi
  [[ -s "$_yc_completion" ]] && source "$_yc_completion"
  unset _yc_completion
fi

# Опциональное предупреждение про версию.
if [[ "${YCCLI_VERSION_WARN:-0}" == "1" && -r "${YCCLI_DIR}/.yc-version" ]]; then
  local _expected _actual
  _expected="$(<"${YCCLI_DIR}/.yc-version")"
  _actual="$(yc version 2>/dev/null | awk '{print $4}')"
  if [[ -n "$_actual" && "$_actual" != "$_expected" ]]; then
    print -u2 "yccli: warning — yc $_actual differs from tested $_expected"
  fi
  unset _expected _actual
fi
