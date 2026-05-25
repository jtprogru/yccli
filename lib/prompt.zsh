# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2155,SC2296,SC2295
# (zsh-специфика: ${(%):-%x}, functions[name], local-namespace переменные)
# yccli :: prompt
#
# Опциональный prompt-segment с активным профилем yc.
# Загружается только при YCCLI_PROMPT=1.
#
# Использование в ~/.zshrc:
#
#   export YCCLI_PROMPT=1
#   # после загрузки плагина:
#   RPROMPT='$(yc_prompt_info)'
#   # или вставка в PROMPT:
#   PROMPT='%n@%m %~ $(yc_prompt_info) %# '
#
# Настройка:
#   YCCLI_PROMPT_TTL          — секунд между запросами к `yc`. По умолчанию 60.
#   YCCLI_PROMPT_FORMAT       — формат строки. Доступны %p (profile), %c (cloud-id),
#                                %f (folder-id/name). По умолчанию "[yc:%p]".
#
# Реализация: `yc config profile list` вызывается не чаще, чем раз в TTL секунд;
# результат кэшируется в файл, чтобы пережить fork/subshells без повторных вызовов.

typeset -g YCCLI_PROMPT_TTL="${YCCLI_PROMPT_TTL:-60}"
typeset -g YCCLI_PROMPT_FORMAT="${YCCLI_PROMPT_FORMAT:-[yc:%p]}"

# Файл кэша prompt-info — общий для всех shell-ов.
typeset -g _YCCLI_PROMPT_CACHE="${YCCLI_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/yccli}/prompt"

_yccli_prompt_refresh() {
  local cache_dir="${_YCCLI_PROMPT_CACHE:h}"
  [[ -d "$cache_dir" ]] || mkdir -p "$cache_dir" 2>/dev/null || return 1

  local profile
  profile="$(yc config profile list 2>/dev/null | awk '/ ACTIVE$/{print $1}')"
  [[ -n "$profile" ]] || profile="?"

  local folder cloud
  folder="$(yc config get folder-id 2>/dev/null)"
  cloud="$(yc config get cloud-id 2>/dev/null)"

  print -r -- "${profile}|${cloud}|${folder}" >| "$_YCCLI_PROMPT_CACHE"
}

_yccli_file_mtime() {
  # GNU stat (Linux) → BSD stat (macOS) → 0 как fallback.
  # Порядок важен: на Linux `stat -f %m` возвращает mount-point (строку)
  # с нулевым exit code, поэтому BSD-вариант идёт ПОСЛЕ GNU.
  local m
  m="$(stat -c %Y "$1" 2>/dev/null)"
  if [[ "$m" =~ ^[0-9]+$ ]]; then echo "$m"; return; fi
  m="$(stat -f %m "$1" 2>/dev/null)"
  if [[ "$m" =~ ^[0-9]+$ ]]; then echo "$m"; return; fi
  echo 0
}

yc_prompt_info() {
  # Если кэш старше TTL — обновим.
  if [[ ! -s "$_YCCLI_PROMPT_CACHE" ]] || \
     (( $(date +%s) - $(_yccli_file_mtime "$_YCCLI_PROMPT_CACHE") > YCCLI_PROMPT_TTL )); then
    _yccli_prompt_refresh
  fi

  [[ -s "$_YCCLI_PROMPT_CACHE" ]] || return 0
  local profile cloud folder
  local content="$(<"$_YCCLI_PROMPT_CACHE")"
  local -a parts=("${(@s:|:)content}")
  profile="${parts[1]:-?}"
  cloud="${parts[2]}"
  folder="${parts[3]}"

  local out="${YCCLI_PROMPT_FORMAT}"
  # В zsh '%' в pattern parameter expansion нужно экранировать.
  out="${out//\%p/$profile}"
  out="${out//\%c/$cloud}"
  out="${out//\%f/$folder}"
  print -rn -- "$out"
}

# Инвалидация кэша при смене профиля через наши хелперы.
_yccli_prompt_invalidate() { rm -f -- "$_YCCLI_PROMPT_CACHE" 2>/dev/null; }

# Оборачиваем ycpa / yc-folder-set / yc-cloud-set: после успешной смены
# контекста — сбрасываем кэш prompt-info, чтобы пользователь увидел изменение
# на следующем приглашении.
if typeset -f ycpa >/dev/null; then
  functions[_yccli_orig_ycpa]="${functions[ycpa]}"
  ycpa() { _yccli_orig_ycpa "$@" && _yccli_prompt_invalidate; }
fi
if typeset -f yc-folder-set >/dev/null; then
  functions[_yccli_orig_yc_folder_set]="${functions[yc-folder-set]}"
  yc-folder-set() { _yccli_orig_yc_folder_set "$@" && _yccli_prompt_invalidate; }
fi
if typeset -f yc-cloud-set >/dev/null; then
  functions[_yccli_orig_yc_cloud_set]="${functions[yc-cloud-set]}"
  yc-cloud-set() { _yccli_orig_yc_cloud_set "$@" && _yccli_prompt_invalidate; }
fi
