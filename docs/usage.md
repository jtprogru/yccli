# Использование

## Базовый цикл

```sh
yci                          # yc init
ycpl                         # список профилей
ycpa my-prod                 # активировать профиль
yc-folder-set b1g...         # установить folder-id для активного профиля
ycw                          # whoami (текущий аккаунт)
```

## Compute (VM)

```sh
ycvml                        # список VM
ycvmg vm-id                  # детали VM
ycvmssh vm-id                # SSH в VM
ycvmser vm-id                # последний serial-port output
```

## Kubernetes

```sh
yck8sl                       # список кластеров
yck8sg cluster-id            # детали
yck8scfg cluster-id          # сгенерировать kubeconfig (external)
yck8scfgi cluster-id         # internal endpoint (внутри облака)
yck8snodes cluster-id        # все ноды кластера
yck8sngl                     # node-groups
```

## VPC

```sh
ycnetl                       # сети
ycsubl                       # подсети
ycsgl                        # security-groups
ycaddrl                      # public/internal addresses
```

## IAM и токены

```sh
ycsal                        # сервис-аккаунты
ycsac --name svc-1           # создать сервис-аккаунт
ycsakey-iam svc-1            # IAM-ключ для SA
yctoken                      # IAM-токен в stdout (для CI)
```

## Serverless

```sh
ycfnl                        # functions
ycfninvoke fn-id             # вызов
ycfnlog fn-id                # логи
ycctrl                       # serverless containers
yctrgl                       # triggers
```

## Managed DB

```sh
ycpgl                        # PostgreSQL clusters
ycpgconnect cluster-id       # iam-auth connect
ycchl                        # ClickHouse
ycmyl                        # MySQL
yckafkal                     # Kafka
```

## Прочее

```sh
ycs3l                        # Object Storage buckets
yclbxl                       # Lockbox secrets
yclbxpay secret-id           # payload секрета (внимание — секреты в stdout)
ycregl                       # Container Registry
ycregdocker                  # настроить docker-credential helper
yccertl                      # сертификаты
```

## Деструктивные операции

По умолчанию выключены. Включите явно:

```sh
export YCCLI_DESTRUCTIVE=1
```

Тогда станут доступны функции с подтверждением:

```sh
ycvmd vm-id                  # подтверждение -> yc compute instance delete
ycnetd net-id                # подтверждение -> yc vpc network delete
yck8sd cluster-id            # подтверждение -> yc managed-kubernetes cluster delete
```

В non-interactive режиме подтверждение всегда отклоняется — безопасно для CI.

## Полная таблица

См. [docs/aliases.md](aliases.md).
