# Конфигурация

Плагин управляется переменными окружения. Все переменные читаются один раз при загрузке `yccli.plugin.zsh`.

## `YCCLI_DISABLE_GROUPS`

Список модулей через пробел, которые НЕ нужно загружать. Имена соответствуют файлам в `lib/` (без расширения).

Доступные модули:

```
_core               # init/version/profile/config (отключение приведёт к потере базовых алиасов)
resource-manager    # cloud, folder
iam                 # service accounts, keys, tokens
compute             # VM, disks, snapshots, images
vpc                 # networks, subnets, security-groups, addresses
kms                 # симметричные ключи и crypto
k8s                 # managed-kubernetes
serverless          # function, container, trigger, api-gateway
storage             # Object Storage buckets
dns                 # Cloud DNS zones
container           # container registry
lb                  # network LB + application LB
cm                  # certificate-manager
lockbox             # секреты
logging             # log groups, read/write
managed-db          # postgres/mysql/clickhouse/redis/mongodb/kafka/opensearch
```

Пример: на машине, где не нужны managed DBs и serverless:

```sh
export YCCLI_DISABLE_GROUPS="managed-db serverless"
```

## `YCCLI_REQUIRE_YC`

- `0` (по умолчанию) — если `yc` не найден в `$PATH`, плагин просто ничего не делает (не ломает shell).
- `1` — плагин завершает загрузку с ошибкой в stderr. Полезно в CI и dotfiles-репах.

## `YCCLI_DESTRUCTIVE`

Включает `lib/destructive.zsh`: обёртки для `delete`/`stop`/etc с интерактивным подтверждением.

```sh
export YCCLI_DESTRUCTIVE=1
```

В non-interactive shell (CI, скрипты) обёртки всегда возвращают `false` — реальная деструкция не происходит.

## `YCCLI_ENABLE_COMPLETION`

Подгружает [нативное `yc completion zsh`](https://yandex.cloud/docs/cli/concepts/completion) с кэшированием.

```sh
export YCCLI_ENABLE_COMPLETION=1
```

Кэш хранится в `$YCCLI_CACHE_DIR` и регенерируется автоматически, если бинарник `yc` свежее кэша.

## `YCCLI_CACHE_DIR`

Каталог для кэша. По умолчанию — `${XDG_CACHE_HOME:-$HOME/.cache}/yccli`.

## `YCCLI_VERSION_WARN`

Сравнивает текущую версию `yc` с содержимым `.yc-version` и печатает предупреждение в stderr при mismatch. Не падает.

```sh
export YCCLI_VERSION_WARN=1
```

## Полный пример `~/.zshrc`

```sh
# yccli config
export YCCLI_REQUIRE_YC=1
export YCCLI_ENABLE_COMPLETION=1
export YCCLI_DISABLE_GROUPS="managed-db"
# export YCCLI_DESTRUCTIVE=1   # включайте сознательно

# затем подключение плагина любым менеджером:
plugins=(... yccli)
# или: zinit light jtprogru/yccli
```
