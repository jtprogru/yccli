# Changelog

Все значимые изменения проекта документируются в этом файле.
Формат — [Keep a Changelog](https://keepachangelog.com/ru/1.1.0/),
версионирование — [SemVer](https://semver.org/lang/ru/).

## [Unreleased]

## [1.0.0] - 2026-05-25

### BREAKING

- Полная перестановка алиасов. Имена `yckms` (без суффикса) больше не существует; используйте `yckmsl`/`yckmsg`/`yckmsc`. Алиас `ycpa` теперь функция (без trailing space).
- Минимальная версия `yc` зафиксирована в `.yc-version` — `1.10.0`. На предыдущих версиях работа возможна, но не тестируется.

### Added

- Модульная структура: `yccli.plugin.zsh` + `lib/<group>.zsh` для каждого сервиса.
- 60+ алиасов и 80+ helper-функций для: `iam`, `resource-manager`, `compute`, `vpc`, `kms`, `managed-kubernetes`, `serverless`, `storage`, `dns`, `container registry`, `load-balancer`, `application-load-balancer`, `certificate-manager`, `lockbox`, `logging`, managed DBs (`postgres`, `mysql`, `clickhouse`, `redis`, `mongodb`, `kafka`, `opensearch`).
- Переменные конфигурации: `YCCLI_DISABLE_GROUPS`, `YCCLI_REQUIRE_YC`, `YCCLI_DESTRUCTIVE`, `YCCLI_ENABLE_COMPLETION`, `YCCLI_CACHE_DIR`, `YCCLI_VERSION_WARN`.
- Опциональная подгрузка `yc completion zsh` с кэшированием.
- Опциональный `lib/destructive.zsh` для `delete`/`stop` с интерактивным подтверждением.
- Документация: `docs/installation.md`, `docs/usage.md`, `docs/aliases.md` (автогенерация), `docs/configuration.md`, `docs/conventions.md`.
- Bats-тесты (`tests/`) с mock-`yc`: 25 тестов покрывают загрузку, идемпотентность, отключение групп, expansion алиасов, передачу argv, отсутствие коллизий имён.
- CI на GitHub Actions: zsh-syntax-check, shellcheck (advisory), shfmt (advisory), проверка актуальности `docs/aliases.md`, bats на ubuntu+macos, smoke-тест без `yc`.
- `.editorconfig`, `LICENSE`.

### Changed

- README расширен: бейджи, поддерживаемая версия `yc`, быстрая установка для oh-my-zsh и zinit, таблица env-переменных.

## [0.1.0] - 2024-10-10

Первый коммит. Семь алиасов для базовых команд `yc`.

[Unreleased]: https://github.com/jtprogru/yccli/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/jtprogru/yccli/releases/tag/v1.0.0
[0.1.0]: https://github.com/jtprogru/yccli/releases/tag/v0.1.0
