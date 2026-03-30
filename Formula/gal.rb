class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.425"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.425/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "9ef2f800062261b7c9fdebbf36d329ce668ad7b347d24b3abf3e512434e0de6b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.425/gal-#{version}-darwin-x64.tar.gz"
      sha256 "9ee31d5572b636ae9ac9370907a839a138bece9349025c404b16e99c1da5e873"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.425/gal-#{version}-linux-x64.tar.gz"
      sha256 "81bf6167d2019f3f8b779964cea8024ba5734b39c9df88dc3066214d873b1053"
    end
  end

  def install
    libexec.install "gal" => "gal-real"
    bin.mkpath
    bin.install_symlink(var/"gal"/version/"gal" => "gal")
  end

  def post_install
    install_root = var/"gal"/version
    install_root.mkpath

    dest = install_root/"gal"
    dest.delete if dest.exist?
    dest.write((libexec/"gal-real").binread, mode: "wb")
    dest.chmod(0755)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gal --version")
  end
end
