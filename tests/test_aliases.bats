#!/usr/bin/env bats
# Тесты: алиасы определены и разворачиваются в правильные команды.

setup() {
  ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  export PATH="$ROOT/tests/mocks:$PATH"
}

_alias() {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && alias $1" 2>/dev/null | sed -e "s/^$1='//" -e "s/'$//"
}

@test "ycvml -> yc compute instance list" {
  result="$(_alias ycvml)"
  [ "$result" = "yc compute instance list" ]
}

@test "yck8sl -> yc managed-kubernetes cluster list" {
  result="$(_alias yck8sl)"
  [ "$result" = "yc managed-kubernetes cluster list" ]
}

@test "ycnetl -> yc vpc network list" {
  result="$(_alias ycnetl)"
  [ "$result" = "yc vpc network list" ]
}

@test "ycsal -> yc iam service-account list" {
  result="$(_alias ycsal)"
  [ "$result" = "yc iam service-account list" ]
}

@test "ycpgl -> yc managed-postgresql cluster list" {
  result="$(_alias ycpgl)"
  [ "$result" = "yc managed-postgresql cluster list" ]
}

@test "ycs3l -> yc storage bucket list" {
  result="$(_alias ycs3l)"
  [ "$result" = "yc storage bucket list" ]
}

@test "yctoken -> yc iam create-token" {
  result="$(_alias yctoken)"
  [ "$result" = "yc iam create-token" ]
}

@test "at least 50 aliases are defined" {
  count=$(zsh -c "source '$ROOT/yccli.plugin.zsh' && alias | grep -cE '^yc'")
  [ "$count" -ge 50 ]
}
