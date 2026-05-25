# Установка

## Требования

- Zsh 5.8+
- [Yandex Cloud CLI](https://yandex.cloud/docs/cli/quickstart) (`yc`) в `$PATH`. Текущая поддерживаемая версия — см. [`.yc-version`](../.yc-version).

Без `yc` плагин по умолчанию тихо самоустранится при загрузке. Жёсткий режим — `export YCCLI_REQUIRE_YC=1`.

---

## oh-my-zsh

```sh
git clone https://github.com/jtprogru/yccli "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/yccli"
```

В `~/.zshrc`:

```sh
plugins=(git ... yccli)
```

Перезапустите shell или выполните `exec zsh`.

## zinit

```sh
# turbo-режим (отложенная загрузка):
zinit ice wait lucid
zinit light jtprogru/yccli

# или просто:
zinit light jtprogru/yccli
```

## antidote

```sh
# ~/.zsh_plugins.txt
jtprogru/yccli
```

## sheldon

```toml
# ~/.config/sheldon/plugins.toml
[plugins.yccli]
github = "jtprogru/yccli"
```

## antigen

```sh
antigen bundle jtprogru/yccli
```

## zplug

```sh
zplug "jtprogru/yccli"
```

## Manual install

```sh
git clone https://github.com/jtprogru/yccli ~/.local/share/yccli
```

В `~/.zshrc`:

```sh
source ~/.local/share/yccli/yccli.plugin.zsh
```

## Homebrew (планируется)

Tap-формула — будущая задача (см. CHANGELOG).

---

## Проверка установки

```sh
yc version
typeset -f yc-profile-current && echo "yccli loaded"
alias | grep -cE '^yc'    # должно быть >50
```

## Удаление

Удалите соответствующую строку из `.zshrc` / конфига менеджера и каталог плагина (oh-my-zsh: `$ZSH_CUSTOM/plugins/yccli`).
