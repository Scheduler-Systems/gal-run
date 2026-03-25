class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.336"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.336/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "29d7ccfc0a7be7adb9b7b2bfe7a304c69b1eaea519115cc5cf72e25f9846d512"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.336/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ecddd304abae8b640beb3bc608071cc4e13043809559d33caff539ed89e7e7b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.336/gal-#{version}-linux-x64.tar.gz"
      sha256 "877edf3a6bbee3a85b4a6b316775dde06eb5d2c676e1b47828eaafa6a2a19e65"
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
