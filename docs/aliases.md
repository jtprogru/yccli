# Алиасы и функции

Автоматически сгенерировано из `lib/*.zsh`. Не редактируйте вручную — запустите `zsh scripts/gen-aliases-doc.zsh`.

## `_core`

| Имя | Команда |
| --- | ------- |
| `yci` | `yc init` |
| `ycif` | `yc init --federation-id` |
| `ycv` | `yc version` |
| `ycu` | `yc components update` |
| `ycw` | `yc iam whoami` |
| `yccl` | `yc config list` |
| `yccg` | `yc config get` |
| `yccs` | `yc config set` |
| `ycpl` | `yc config profile list` |
| `ycpg` | `yc config profile get` |
| `ycpa` | `yc config profile activate <args>` |
| `ycpc` | `yc config profile create <args>` |
| `ycpd` | `yc config profile delete <args>` |
| `yc-folder-set` | `yc config set folder-id <args>` |
| `yc-cloud-set` | `yc config set cloud-id  <args>` |

## `resource-manager`

| Имя | Команда |
| --- | ------- |
| `yccloudl` | `yc resource-manager cloud list` |
| `ycfldl` | `yc resource-manager folder list` |
| `yccloudg` | `yc resource-manager cloud  get <args>` |
| `ycfldg` | `yc resource-manager folder get <args>` |
| `ycfldc` | `yc resource-manager folder create <args>` |

## `iam`

| Имя | Команда |
| --- | ------- |
| `ycsal` | `yc iam service-account list` |
| `yckeyl` | `yc iam key list` |
| `ycrolel` | `yc iam role list` |
| `yctoken` | `yc iam create-token` |
| `ycsag` | `yc iam service-account get    <args>` |
| `ycsac` | `yc iam service-account create <args>` |
| `ycsau` | `yc iam service-account update <args>` |
| `yckeyg` | `yc iam key get    <args>` |
| `yckeyc` | `yc iam key create <args>` |
| `ycroleg` | `yc iam role get <args>` |
| `ycsakey-access` | `yc iam access-key create --service-account-id <args>` |
| `ycsakey-api` | `yc iam api-key    create --service-account-id <args>` |
| `ycsakey-iam` | `yc iam key        create --service-account-id <args>` |

## `compute`

| Имя | Команда |
| --- | ------- |
| `ycvml` | `yc compute instance list` |
| `ycdskl` | `yc compute disk list` |
| `ycimgl` | `yc compute image list` |
| `ycsnapl` | `yc compute snapshot list` |
| `yczonel` | `yc compute zone list` |
| `ycvmg` | `yc compute instance  get <args>` |
| `ycvmc` | `yc compute instance  create <args>` |
| `ycvmssh` | `yc compute ssh <args>` |
| `ycvmser` | `yc compute instance get-serial-port-output <args>` |
| `ycdskg` | `yc compute disk     get <args>` |
| `ycimgg` | `yc compute image    get <args>` |
| `ycsnapg` | `yc compute snapshot get <args>` |

## `vpc`

| Имя | Команда |
| --- | ------- |
| `ycnetl` | `yc vpc network list` |
| `ycsubl` | `yc vpc subnet list` |
| `ycsgl` | `yc vpc security-group list` |
| `ycaddrl` | `yc vpc address list` |
| `ycgwl` | `yc vpc gateway list` |
| `ycrtl` | `yc vpc route-table list` |
| `ycnetg` | `yc vpc network        get <args>` |
| `ycsubg` | `yc vpc subnet         get <args>` |
| `ycsgg` | `yc vpc security-group get <args>` |
| `ycaddrg` | `yc vpc address        get <args>` |
| `ycgwg` | `yc vpc gateway        get <args>` |
| `ycrtg` | `yc vpc route-table    get <args>` |

## `kms`

| Имя | Команда |
| --- | ------- |
| `yckmsl` | `yc kms symmetric-key list` |
| `yckmsg` | `yc kms symmetric-key get    <args>` |
| `yckmsc` | `yc kms symmetric-key create <args>` |
| `yckmsrot` | `yc kms symmetric-key rotate <args>` |
| `yckmsenc` | `yc kms symmetric-crypto encrypt <args>` |
| `yckmsdec` | `yc kms symmetric-crypto decrypt <args>` |

## `k8s`

| Имя | Команда |
| --- | ------- |
| `yck8sl` | `yc managed-kubernetes cluster list` |
| `yck8sngl` | `yc managed-kubernetes node-group list` |
| `yck8svl` | `yc managed-kubernetes list-versions` |
| `yck8sg` | `yc managed-kubernetes cluster    get <args>` |
| `yck8sngg` | `yc managed-kubernetes node-group get <args>` |
| `yck8scfg` | `yc managed-kubernetes cluster get-credentials --external <args>` |
| `yck8scfgi` | `yc managed-kubernetes cluster get-credentials --internal <args>` |
| `yck8snodes` | `yc managed-kubernetes cluster list-nodes <args>` |

## `serverless`

| Имя | Команда |
| --- | ------- |
| `ycfnl` | `yc serverless function list` |
| `ycctrl` | `yc serverless container list` |
| `yctrgl` | `yc serverless trigger list` |
| `ycapigwl` | `yc serverless api-gateway list` |
| `ycfng` | `yc serverless function    get  <args>` |
| `ycfninvoke` | `yc serverless function    invoke <args>` |
| `ycfnlog` | `yc serverless function    logs <args>` |
| `ycctrg` | `yc serverless container   get <args>` |
| `yctrgg` | `yc serverless trigger     get <args>` |
| `ycapigwg` | `yc serverless api-gateway get <args>` |

## `storage`

| Имя | Команда |
| --- | ------- |
| `ycs3l` | `yc storage bucket list` |
| `ycs3g` | `yc storage bucket get   <args>` |
| `ycs3c` | `yc storage bucket create <args>` |
| `ycs3stat` | `yc storage bucket stats <args>` |

## `dns`

| Имя | Команда |
| --- | ------- |
| `ycdnsl` | `yc dns zone list` |
| `ycdnsg` | `yc dns zone get          <args>` |
| `ycdnsrl` | `yc dns zone list-records <args>` |
| `ycdnsra` | `yc dns zone add-records  <args>` |
| `ycdnsrd` | `yc dns zone delete-records <args>` |

## `container`

| Имя | Команда |
| --- | ------- |
| `ycregl` | `yc container registry list` |
| `ycrepol` | `yc container repository list` |
| `ycimgrl` | `yc container image list` |
| `ycregdocker` | `yc container registry configure-docker` |
| `ycregg` | `yc container registry   get <args>` |
| `ycrepog` | `yc container repository get <args>` |
| `ycimgrg` | `yc container image      get <args>` |

## `lb`

| Имя | Команда |
| --- | ------- |
| `yclbl` | `yc load-balancer network-load-balancer list` |
| `yclbtgl` | `yc load-balancer target-group list` |
| `ycalbl` | `yc application-load-balancer load-balancer list` |
| `ycalbbgl` | `yc application-load-balancer backend-group list` |
| `ycalbtgl` | `yc application-load-balancer target-group list` |
| `ycalbhrl` | `yc application-load-balancer http-router list` |
| `yclbg` | `yc load-balancer network-load-balancer get <args>` |
| `yclbtgg` | `yc load-balancer target-group         get <args>` |
| `ycalbg` | `yc application-load-balancer load-balancer get <args>` |
| `ycalbbgg` | `yc application-load-balancer backend-group get <args>` |
| `ycalbtgg` | `yc application-load-balancer target-group  get <args>` |
| `ycalbhrg` | `yc application-load-balancer http-router   get <args>` |

## `cm`

| Имя | Команда |
| --- | ------- |
| `yccertl` | `yc certificate-manager certificate list` |
| `yccertg` | `yc certificate-manager certificate get     <args>` |
| `yccertcontent` | `yc certificate-manager certificate content <args>` |
| `yccertreq` | `yc certificate-manager certificate request <args>` |

## `lockbox`

| Имя | Команда |
| --- | ------- |
| `yclbxl` | `yc lockbox secret list` |
| `yclbxg` | `yc lockbox secret  get          <args>` |
| `yclbxc` | `yc lockbox secret  create       <args>` |
| `yclbxvl` | `yc lockbox secret  list-versions <args>` |
| `yclbxpay` | `yc lockbox payload get          <args>` |

## `logging`

| Имя | Команда |
| --- | ------- |
| `yclogl` | `yc logging group list` |
| `yclogg` | `yc logging group get   <args>` |
| `yclogc` | `yc logging group create <args>` |
| `yclogstat` | `yc logging group stats <args>` |
| `yclogread` | `yc logging read        <args>` |
| `yclogwrite` | `yc logging write       <args>` |

## `managed-db`

| Имя | Команда |
| --- | ------- |
| `ycpgl` | `yc managed-postgresql cluster list` |
| `ycpgdbl` | `yc managed-postgresql database list` |
| `ycpgul` | `yc managed-postgresql user list` |
| `ycmyl` | `yc managed-mysql cluster list` |
| `ycmydbl` | `yc managed-mysql database list` |
| `ycmyul` | `yc managed-mysql user list` |
| `ycchl` | `yc managed-clickhouse cluster list` |
| `ycchdbl` | `yc managed-clickhouse database list` |
| `ycchul` | `yc managed-clickhouse user list` |
| `ycrdl` | `yc managed-redis cluster list` |
| `ycmgl` | `yc managed-mongodb cluster list` |
| `ycmgdbl` | `yc managed-mongodb database list` |
| `yckafkal` | `yc managed-kafka cluster list` |
| `yckafkatl` | `yc managed-kafka topic list` |
| `ycosl` | `yc managed-opensearch cluster list` |
| `ycpgg` | `yc managed-postgresql cluster get <args>` |
| `ycpgconnect` | `yc managed-postgresql connect     <args>` |
| `ycmyg` | `yc managed-mysql cluster get <args>` |
| `ycchg` | `yc managed-clickhouse cluster get <args>` |
| `ycrdg` | `yc managed-redis cluster get <args>` |
| `ycmgg` | `yc managed-mongodb cluster get <args>` |
| `yckafkag` | `yc managed-kafka cluster get <args>` |
| `ycosg` | `yc managed-opensearch cluster get <args>` |

## `destructive`

Загружается только при `YCCLI_DESTRUCTIVE=1`. Все команды требуют интерактивного подтверждения.

| Имя | Команда |
| --- | ------- |
| `ycvmd` | `_yccli_confirm "Delete VM $*?"          && yc compute instance         delete <args>` |
| `ycvmstop` | `_yccli_confirm "Stop VM $*?"            && yc compute instance         stop   <args>` |
| `ycvmstart` | `yc compute instance start <args>` |
| `ycdskd` | `_yccli_confirm "Delete disk $*?"        && yc compute disk             delete <args>` |
| `ycnetd` | `_yccli_confirm "Delete network $*?"     && yc vpc network              delete <args>` |
| `ycsubd` | `_yccli_confirm "Delete subnet $*?"      && yc vpc subnet               delete <args>` |
| `ycsgd` | `_yccli_confirm "Delete security-group $*?" && yc vpc security-group    delete <args>` |
| `ycsad` | `_yccli_confirm "Delete service account $*?" && yc iam service-account  delete <args>` |
| `yck8sd` | `_yccli_confirm "Delete k8s cluster $*?" && yc managed-kubernetes cluster delete <args>` |
| `ycfldd` | `_yccli_confirm "Delete folder $*?"      && yc resource-manager folder  delete <args>` |
| `ycregd` | `_yccli_confirm "Delete registry $*?"    && yc container registry       delete <args>` |
| `yclbxd` | `_yccli_confirm "Delete secret $*?"      && yc lockbox secret           delete <args>` |
