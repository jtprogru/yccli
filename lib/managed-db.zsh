# shellcheck shell=bash
# yccli :: managed databases (postgres, mysql, clickhouse, redis, mongodb, kafka, opensearch)
#
# Идея: для каждой базы — list/get кластеров и баз, плюс connect там, где есть.

# --- PostgreSQL ---
alias ycpgl='yc managed-postgresql cluster list'
alias ycpgdbl='yc managed-postgresql database list'
alias ycpgul='yc managed-postgresql user list'
ycpgg()       { yc managed-postgresql cluster get "$@"; }
ycpgconnect() { yc managed-postgresql connect     "$@"; }

# --- MySQL ---
alias ycmyl='yc managed-mysql cluster list'
alias ycmydbl='yc managed-mysql database list'
alias ycmyul='yc managed-mysql user list'
ycmyg() { yc managed-mysql cluster get "$@"; }

# --- ClickHouse ---
alias ycchl='yc managed-clickhouse cluster list'
alias ycchdbl='yc managed-clickhouse database list'
alias ycchul='yc managed-clickhouse user list'
ycchg() { yc managed-clickhouse cluster get "$@"; }

# --- Redis ---
alias ycrdl='yc managed-redis cluster list'
ycrdg() { yc managed-redis cluster get "$@"; }

# --- MongoDB ---
alias ycmgl='yc managed-mongodb cluster list'
alias ycmgdbl='yc managed-mongodb database list'
ycmgg() { yc managed-mongodb cluster get "$@"; }

# --- Kafka ---
alias yckafkal='yc managed-kafka cluster list'
alias yckafkatl='yc managed-kafka topic list'
yckafkag() { yc managed-kafka cluster get "$@"; }

# --- OpenSearch ---
alias ycosl='yc managed-opensearch cluster list'
ycosg() { yc managed-opensearch cluster get "$@"; }
