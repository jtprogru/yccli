#!/usr/bin/env bats
# Helper functions: verify argv reaches the mocked `yc`.

setup() {
  ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  export YC_MOCK_LOG="$BATS_TEST_TMPDIR/yc.log"
  : >"$YC_MOCK_LOG"
  export PATH="$ROOT/tests/mocks:$PATH"
}

@test "ycvmg passes id to compute instance get" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && ycvmg fpe123"
  grep -qx "compute instance get fpe123" "$YC_MOCK_LOG"
}

@test "yck8scfg appends --external" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && yck8scfg my-cluster"
  grep -qx "managed-kubernetes cluster get-credentials --external my-cluster" "$YC_MOCK_LOG"
}

@test "yck8scfgi appends --internal" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && yck8scfgi my-cluster"
  grep -qx "managed-kubernetes cluster get-credentials --internal my-cluster" "$YC_MOCK_LOG"
}

@test "ycpa activates profile" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && ycpa my-prod"
  grep -qx "config profile activate my-prod" "$YC_MOCK_LOG"
}

@test "yc-folder-set sets folder-id" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && yc-folder-set b1g123"
  grep -qx "config set folder-id b1g123" "$YC_MOCK_LOG"
}

@test "ycsakey-iam appends --service-account-id" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && ycsakey-iam sa-xyz"
  grep -qx "iam key create --service-account-id sa-xyz" "$YC_MOCK_LOG"
}

@test "function passes multiple arguments" {
  zsh -c "source '$ROOT/yccli.plugin.zsh' && ycvmc --name foo --zone ru-central1-a"
  grep -qx "compute instance create --name foo --zone ru-central1-a" "$YC_MOCK_LOG"
}
