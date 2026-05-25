#!/usr/bin/env zsh
# Генерация docs/aliases.md из содержимого lib/*.zsh.
# В CI запускается с проверкой `git diff --exit-code docs/aliases.md`.

set -euo pipefail

cd "${0:A:h}/.."

out="docs/aliases.md"

{
  print -- "# Алиасы и функции"
  print -- ""
  print -- "Автоматически сгенерировано из \`lib/*.zsh\`. Не редактируйте вручную — запустите \`zsh scripts/gen-aliases-doc.zsh\`."
  print -- ""

  for f in lib/_core.zsh lib/resource-manager.zsh lib/iam.zsh lib/compute.zsh lib/vpc.zsh lib/kms.zsh lib/k8s.zsh lib/serverless.zsh lib/storage.zsh lib/dns.zsh lib/container.zsh lib/lb.zsh lib/cm.zsh lib/lockbox.zsh lib/logging.zsh lib/managed-db.zsh lib/destructive.zsh; do
    [[ -r "$f" ]] || continue

    # заголовок секции = имя файла без .zsh
    section="${${f:t}:r}"
    print -- "## \`${section}\`"
    print -- ""

    if [[ "$section" == "destructive" ]]; then
      print -- "Загружается только при \`YCCLI_DESTRUCTIVE=1\`. Все команды требуют интерактивного подтверждения."
      print -- ""
    fi

    print -- "| Имя | Команда |"
    print -- "| --- | ------- |"

    # алиасы
    grep -E "^alias [a-z0-9_-]+=" "$f" | while read -r line; do
      name="${${line#alias }%%=*}"
      cmd="${line#*=}"
      cmd="${cmd//\'/}"
      print -- "| \`${name}\` | \`${cmd}\` |"
    done

    # функции (однострочные)
    grep -E "^[a-z][a-z0-9_-]*\(\) *\{ .* \}" "$f" | while read -r line; do
      name="${line%%\(\)*}"
      body="${line#*\{ }"
      body="${body% \}*}"
      # очищаем "$@"
      cmd="${body//\"\$@\"/<args>}"
      cmd="${cmd//;/}"
      print -- "| \`${name}\` | \`${cmd}\` |"
    done

    print -- ""
  done
} > "$out"

# Нормализуем хвост: ровно один завершающий \n (без лишних пустых строк).
# $(<file) в zsh обрезает все trailing newlines, printf '%s\n' добавляет один.
printf '%s\n' "$(<"$out")" >"$out.tmp" && mv "$out.tmp" "$out"

print "Wrote ${out} ($(wc -l < "$out") lines)"
