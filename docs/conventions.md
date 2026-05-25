# Конвенции именования

Эти правила применяются при добавлении новых алиасов и функций. Цель — предсказуемость имён и отсутствие коллизий с распространёнными CLI.

## Префиксы

Все имена начинаются с `yc`. Далее — 2–4-буквенный код сервиса:

| Сервис                          | Префикс    |
| ------------------------------- | ---------- |
| init / version / components     | `yci`, `ycv`, `ycu` |
| iam whoami / iam token          | `ycw`, `yctoken` |
| config                          | `ycc...`   |
| config profile                  | `ycp...`   |
| resource-manager cloud          | `yccloud`  |
| resource-manager folder         | `ycfld`    |
| iam service-account             | `ycsa`     |
| iam key                         | `yckey`    |
| iam role                        | `ycrole`   |
| compute instance                | `ycvm`     |
| compute disk                    | `ycdsk`    |
| compute image                   | `ycimg`    |
| compute snapshot                | `ycsnap`   |
| vpc network                     | `ycnet`    |
| vpc subnet                      | `ycsub`    |
| vpc security-group              | `ycsg`     |
| vpc address                     | `ycaddr`   |
| vpc gateway                     | `ycgw`     |
| vpc route-table                 | `ycrt`     |
| kms symmetric                   | `yckms`    |
| managed-kubernetes              | `yck8s`    |
| managed-kubernetes node-group   | `yck8sng`  |
| serverless function             | `ycfn`     |
| serverless container            | `ycctr`    |
| serverless trigger              | `yctrg`    |
| serverless api-gateway          | `ycapigw`  |
| storage bucket                  | `ycs3`     |
| dns zone                        | `ycdns`    |
| container registry              | `ycreg`    |
| container repository            | `ycrepo`   |
| container image                 | `ycimgr`   |
| load-balancer                   | `yclb`     |
| application-load-balancer       | `ycalb`    |
| certificate-manager             | `yccert`   |
| lockbox                         | `yclbx`    |
| logging                         | `yclog`    |
| managed-postgresql              | `ycpg`     |
| managed-mysql                   | `ycmy`     |
| managed-clickhouse              | `ycch`     |
| managed-redis                   | `ycrd`     |
| managed-mongodb                 | `ycmg`     |
| managed-kafka                   | `yckafka`  |
| managed-opensearch              | `ycos`     |

## Суффиксы действий

| Суффикс | Действие |
| ------- | -------- |
| `l`     | list     |
| `g`     | get      |
| `c`     | create   |
| `u`     | update   |
| `d`     | delete (только в `lib/destructive.zsh`) |

Тематические суффиксы: `dbl` (database list), `ul` (user list), `vl` (versions list), `cfg` (kubeconfig), `enc`/`dec` (crypto), `rl`/`ra`/`rd` (records list/add/delete).

## Алиас vs функция

- **Алиас** — для команды без обязательных аргументов: `alias ycvml='yc compute instance list'`.
- **Функция** — для команды с аргументом: `ycvmg() { yc compute instance get "$@"; }`. Это сохраняет работоспособность completion и позволяет передать любое число аргументов.

> Не используйте алиасы с trailing space или фиксированными аргументами. Старая запись вроде `alias ycpa='yc config profile activate '` ломает `compinit` и аргумент должен подаваться через пробел — это анти-паттерн.

## Деструктивные команды

- Никогда не добавляются в основные модули.
- Только в `lib/destructive.zsh`, который грузится по `YCCLI_DESTRUCTIVE=1`.
- Обязательно через `_yccli_confirm` (см. `lib/destructive.zsh`).
- В non-interactive shell подтверждение всегда отклоняется.

## Коллизии

Перед добавлением нового алиаса убедитесь, что имя не пересекается с:

- собственно `yc`,
- `git`, `kubectl`, `docker`, `aws`, `gcloud`, `az`, `terraform`, `helm`, `ssh`, `scp`, `rsync`,
- стандартными `ls`/`cp`/`mv`/`rm`/`cd`/`pwd`/`echo`/`grep`/`sed`/`awk`.

Тест на коллизии запускается в CI (`tests/test_collisions.bats`).

## Шаблон нового модуля

```zsh
# shellcheck shell=bash
# yccli :: <service>

alias yc<svc>l='yc <service> list'

yc<svc>g()  { yc <service> get    "$@"; }
yc<svc>c()  { yc <service> create "$@"; }
```

Не забудьте добавить имя файла в `_yccli_modules` в `yccli.plugin.zsh`.
