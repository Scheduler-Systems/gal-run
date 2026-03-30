class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.435"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.435/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "79349ab0b6a05714d12dc73edeebd68eafa7ff5f4d66bfe68d9e5274bfa06224"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.435/gal-#{version}-darwin-x64.tar.gz"
      sha256 "e01b27b5ffd1c00dacff239917e157d84054a337b72c6b042306e7b3e4c8e63a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.435/gal-#{version}-linux-x64.tar.gz"
      sha256 "7c2defef2b2e0b8eaa19095a28f7b66f215d358b26d896f5719fd1cf19c9cce3"
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
