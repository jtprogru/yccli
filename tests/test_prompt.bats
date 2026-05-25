#!/usr/bin/env bats
# Prompt-segment: должен быть opt-in и корректно подставлять плейсхолдеры.

setup() {
  ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  export PATH="$ROOT/tests/mocks:$PATH"
  export YCCLI_CACHE_DIR="$BATS_TEST_TMPDIR/cache"
}

@test "without YCCLI_PROMPT yc_prompt_info is not defined" {
  run zsh -c "
    source '$ROOT/yccli.plugin.zsh'
    typeset -f yc_prompt_info >/dev/null && echo HAS || echo NO
  "
  [ "$status" -eq 0 ]
  [[ "$output" == *"NO"* ]]
}

@test "with YCCLI_PROMPT=1 yc_prompt_info is defined" {
  run zsh -c "
    YCCLI_PROMPT=1
    source '$ROOT/yccli.plugin.zsh'
    typeset -f yc_prompt_info >/dev/null && echo HAS
  "
  [ "$status" -eq 0 ]
  [[ "$output" == *"HAS"* ]]
}

@test "yc_prompt_info substitutes %p with profile name" {
  # mock yc возвращает пустой profile list; функция должна вернуть '?' fallback.
  # Создадим кэш руками, чтобы не зависеть от mock-выхлопа yc config profile list.
  mkdir -p "$YCCLI_CACHE_DIR"
  echo "myprof|cloud-id-x|folder-id-y" > "$YCCLI_CACHE_DIR/prompt"

  run zsh -c "
    export YCCLI_PROMPT=1
    export YCCLI_CACHE_DIR='$YCCLI_CACHE_DIR'
    export YCCLI_PROMPT_TTL=9999
    source '$ROOT/yccli.plugin.zsh'
    yc_prompt_info
  "
  [ "$status" -eq 0 ]
  [[ "$output" == "[yc:myprof]" ]]
}

@test "custom YCCLI_PROMPT_FORMAT with %p %c %f" {
  mkdir -p "$YCCLI_CACHE_DIR"
  echo "p1|c1|f1" > "$YCCLI_CACHE_DIR/prompt"

  run zsh -c "
    export YCCLI_PROMPT=1
    export YCCLI_CACHE_DIR='$YCCLI_CACHE_DIR'
    export YCCLI_PROMPT_TTL=9999
    export YCCLI_PROMPT_FORMAT='p=%p c=%c f=%f'
    source '$ROOT/yccli.plugin.zsh'
    yc_prompt_info
  "
  [ "$status" -eq 0 ]
  [[ "$output" == "p=p1 c=c1 f=f1" ]]
}
