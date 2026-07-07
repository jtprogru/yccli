# yccli

Zsh-плагин с алиасами и helper-функциями для [Yandex Cloud CLI](https://yandex.cloud/docs/cli/).

[![CI](https://github.com/jtprogru/yccli/actions/workflows/ci.yml/badge.svg)](https://github.com/jtprogru/yccli/actions/workflows/ci.yml)
![yc](https://img.shields.io/badge/yc-1.10.0-blue)
![license](https://img.shields.io/badge/license-MIT-green)

> Совместим с oh-my-zsh, zinit, antidote, sheldon и ручным `source`.

---

## Возможности

- 60+ алиасов и 80+ функций для частых операций `yc` (list/get/create) — без необходимости держать в голове полные имена групп.
- Покрыты: `iam`, `resource-manager`, `compute`, `vpc`, `kms`, `managed-kubernetes`, `serverless`, `storage`, `dns`, `container registry`, `load-balancer`, `application-load-balancer`, `certificate-manager`, `lockbox`, `logging`, managed DBs (PostgreSQL, MySQL, ClickHouse, Redis, MongoDB, Kafka, OpenSearch).
- Опциональная подгрузка zsh-completion от самого `yc` (с кэшированием).
- Деструктивные команды (`delete`, `stop`) — opt-in, обёрнуты в подтверждение.
- Отключение ненужных групп через `YCCLI_DISABLE_GROUPS`.

## Быстрая установка

### oh-my-zsh

```sh
git clone https://github.com/jtprogru/yccli "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/yccli"
```

В `~/.zshrc`:

```sh
plugins=(... yccli)
```

### zinit

```sh
zinit light jtprogru/yccli
```

### Прочие менеджеры и ручная установка

См. [docs/installation.md](docs/installation.md).

## Конфигурация

| Переменная                 | Значение по умолчанию | Назначение                                                                 |
| -------------------------- | --------------------- | -------------------------------------------------------------------------- |
| `YCCLI_DISABLE_GROUPS`     | _не задано_           | Список модулей через пробел, которые НЕ грузить (см. `lib/`).              |
| `YCCLI_REQUIRE_YC`         | `0`                   | `1` — падать с ошибкой, если `yc` не установлен.                           |
| `YCCLI_DESTRUCTIVE`        | `0`                   | `1` — включить алиасы `delete`/`stop` с подтверждением.                    |
| `YCCLI_ENABLE_COMPLETION`  | `0`                   | `1` — подгружать `yc completion zsh` с кэшированием.                       |
| `YCCLI_CACHE_DIR`          | `$XDG_CACHE_HOME/yccli` | Каталог для кэша completion.                                            |
| `YCCLI_PROMPT`             | `0`                   | `1` — функция `yc_prompt_info` для PROMPT/RPROMPT (с кэшем).               |
| `YCCLI_VERSION_WARN`       | `0`                   | `1` — предупреждать при mismatch с `.yc-version`.                          |

Подробнее: [docs/configuration.md](docs/configuration.md).

## Алиасы и функции

Полная таблица: [docs/aliases.md](docs/aliases.md).

Примеры:

```sh
ycvml                              # yc compute instance list
ycnetl                             # yc vpc network list
yck8sl                             # yc managed-kubernetes cluster list
yck8scfg my-cluster                # kubeconfig (external endpoint)
ycpa my-prod                       # yc config profile activate my-prod
yctoken                            # IAM-токен в stdout
```

## Версии Yandex Cloud CLI

Текущий релиз протестирован с:

```
Yandex Cloud CLI 1.10.0 darwin/arm64
Yandex Cloud CLI 1.10.0 linux/amd64
```

Совместимость с другими версиями возможна, но не гарантируется. Файл [`.yc-version`](./.yc-version) фиксирует поддерживаемую версию для скриптов и CI.

## Документация

- [Установка](docs/installation.md)
- [Использование](docs/usage.md)
- [Алиасы и функции](docs/aliases.md)
- [Конфигурация](docs/configuration.md)
- [Конвенции именования](docs/conventions.md)
- [CHANGELOG](CHANGELOG.md)

## Лицензия

MIT — см. [LICENSE](LICENSE).
