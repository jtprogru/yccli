# Homebrew formula для yccli.
# Установка через tap:
#   brew tap jtprogru/yccli https://github.com/jtprogru/homebrew-yccli
#   brew install yccli
#
# После brew install активируйте плагин одной строкой в ~/.zshrc:
#   source "$(brew --prefix)/share/yccli/yccli.plugin.zsh"
#
# Формула предполагает отдельный tap-репозиторий jtprogru/homebrew-yccli,
# в котором она лежит как Formula/yccli.rb. Подробности установки tap-а — в
# docs/installation.md.

class Yccli < Formula
  desc "Zsh-плагин с алиасами и helper-функциями для Yandex Cloud CLI"
  homepage "https://github.com/jtprogru/yccli"
  url "https://github.com/jtprogru/yccli/archive/refs/tags/v1.0.0.tar.gz"
  # sha256 нужно обновлять при каждом релизе.
  # Получить:  curl -L https://github.com/jtprogru/yccli/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
  sha256 "REPLACE_WITH_RELEASE_TARBALL_SHA256"
  license "MIT"
  head "https://github.com/jtprogru/yccli.git", branch: "main"

  depends_on "zsh"
  # yc CLI ставится отдельно (вне Homebrew):
  #   curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

  def install
    pkgshare.install "yccli.plugin.zsh"
    pkgshare.install "lib"
    (pkgshare/".yc-version").write File.read(".yc-version")
  end

  def caveats
    <<~EOS
      Активируйте плагин в ~/.zshrc:
        source "#{opt_pkgshare}/yccli.plugin.zsh"

      yc CLI устанавливается отдельно:
        curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
    EOS
  end

  test do
    # Минимальный smoke-тест: плагин загружается без падений.
    system "zsh", "-c", "source #{pkgshare}/yccli.plugin.zsh && echo OK"
  end
end
