#!/usr/bin/env bats
# Names must not collide with common CLIs.

setup() {
  ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  export PATH="$ROOT/tests/mocks:$PATH"
}

_names() {
  zsh -c "
    # снимок алиасов/функций ДО загрузки плагина
    before_aliases=\$(alias | sed 's/=.*//' | sort -u)
    before_funcs=\$(typeset -f + | sort -u)
    source '$ROOT/yccli.plugin.zsh' >/dev/null 2>&1
    after_aliases=\$(alias | sed 's/=.*//' | sort -u)
    after_funcs=\$(typeset -f + | sort -u)
    # печатаем только то, что добавил плагин
    comm -13 <(echo \"\$before_aliases\") <(echo \"\$after_aliases\")
    comm -13 <(echo \"\$before_funcs\")   <(echo \"\$after_funcs\")
  "
}

@test "no name equals 'yc' itself" {
  names="$(_names)"
  ! echo "$names" | grep -qx 'yc'
}

@test "no name collides with known CLIs" {
  names="$(_names)"
  for forbidden in git kubectl docker aws gcloud az terraform helm ssh scp rsync ls cp mv rm cd pwd echo grep sed awk find; do
    if echo "$names" | grep -qx "$forbidden"; then
      echo "Collision: $forbidden" >&2
      false
    fi
  done
}

@test "all names start with 'yc'" {
  names="$(_names)"
  while IFS= read -r n; do
    [[ -z "$n" ]] && continue
    if [[ "$n" != yc* ]]; then
      echo "Bad name (not yc-prefixed): $n" >&2
      false
    fi
  done <<<"$names"
}
