#!/usr/bin/env bats
# Plugin loading: idempotency, group disabling, yc requirement.

setup() {
  ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  export PATH="$ROOT/tests/mocks:$PATH"
  export YC_MOCK_LOG="$BATS_TEST_TMPDIR/yc.log"
  : >"$YC_MOCK_LOG"
}

@test "plugin loads cleanly" {
  run zsh -c "source '$ROOT/yccli.plugin.zsh' && echo OK"
  [ "$status" -eq 0 ]
  [[ "$output" == *"OK"* ]]
}

@test "second source is idempotent (_YCCLI_LOADED guard)" {
  run zsh -c "
    source '$ROOT/yccli.plugin.zsh'
    before=\$(alias | grep -c '^yc')
    source '$ROOT/yccli.plugin.zsh'
    after=\$(alias | grep -c '^yc')
    [ \"\$before\" = \"\$after\" ] && echo SAME
  "
  [ "$status" -eq 0 ]
  [[ "$output" == *"SAME"* ]]
}

@test "no yc and YCCLI_REQUIRE_YC=0 returns silently" {
  run env -i HOME="$HOME" PATH="/usr/bin:/bin" zsh -c "source '$ROOT/yccli.plugin.zsh' && echo CLEAN"
  [ "$status" -eq 0 ]
  [[ "$output" == *"CLEAN"* ]]
}

@test "no yc and YCCLI_REQUIRE_YC=1 reports error" {
  run env -i HOME="$HOME" PATH="/usr/bin:/bin" YCCLI_REQUIRE_YC=1 zsh -c "source '$ROOT/yccli.plugin.zsh' && echo SHOULD_NOT_PRINT"
  [[ "$output" != *"SHOULD_NOT_PRINT"* ]] || [[ "$output" == *"not found"* ]]
}

@test "YCCLI_DISABLE_GROUPS=managed-db excludes ycpgl" {
  run zsh -c "
    YCCLI_DISABLE_GROUPS='managed-db'
    source '$ROOT/yccli.plugin.zsh'
    alias ycpgl 2>&1 || echo MISSING
    alias ycvml | grep -o 'yc compute instance list'
  "
  [ "$status" -eq 0 ]
  [[ "$output" == *"MISSING"* ]]
  [[ "$output" == *"yc compute instance list"* ]]
}

@test "YCCLI_DESTRUCTIVE=0 hides destructive functions" {
  run zsh -c "
    source '$ROOT/yccli.plugin.zsh'
    typeset -f ycvmd >/dev/null && echo HAS || echo NO
  "
  [ "$status" -eq 0 ]
  [[ "$output" == *"NO"* ]]
}

@test "YCCLI_DESTRUCTIVE=1 exposes destructive functions" {
  run zsh -c "
    YCCLI_DESTRUCTIVE=1
    source '$ROOT/yccli.plugin.zsh'
    typeset -f ycvmd >/dev/null && echo HAS
  "
  [ "$status" -eq 0 ]
  [[ "$output" == *"HAS"* ]]
}
