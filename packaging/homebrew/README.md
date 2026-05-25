# Homebrew tap для yccli

Формула здесь — реплика того, что должно лежать в отдельном репо `jtprogru/homebrew-yccli` как `Formula/yccli.rb`.

## Создание tap-репозитория

1. Создать пустой репозиторий `jtprogru/homebrew-yccli` на GitHub.
2. Скопировать `yccli.rb` в `Formula/yccli.rb` нового репо.
3. После каждого релиза `vX.Y.Z` обновлять `url` и `sha256`:

```sh
# Получить sha256 релизного тарбола:
curl -fsSL "https://github.com/jtprogru/yccli/archive/refs/tags/vX.Y.Z.tar.gz" \
  | shasum -a 256
```

## Установка пользователем

```sh
brew tap jtprogru/yccli
brew install yccli
```

Затем в `~/.zshrc`:

```sh
source "$(brew --prefix)/share/yccli/yccli.plugin.zsh"
```

## Альтернативы

- **oh-my-zsh / zinit / antidote / sheldon** — см. [docs/installation.md](../../docs/installation.md). Для большинства пользователей это удобнее: менеджер плагинов уже стоит, и подключение в одну строку.
- **Manual `git clone`** — самый простой путь для contributor'ов и людей без plugin-менеджера.

## Автоматизация обновления формулы (план)

Можно добавить в `.github/workflows/release.yml` шаг `homebrew-releaser`, который автоматически бампит формулу в tap-репозитории при пуше тега. Сейчас формулу обновляем вручную.
