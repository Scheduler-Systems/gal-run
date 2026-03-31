class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.458"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.458/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "579aef0432bce36e4ae3b85d63c3fdd275e41d4f3d323eac5e99fa2a2b2523d2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.458/gal-#{version}-darwin-x64.tar.gz"
      sha256 "fafa5e95fe0a0e77faad80ed7c857103195c022ce404f83d2d77a5f0ea7c6246"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.458/gal-#{version}-linux-x64.tar.gz"
      sha256 "92c63cbe1c7d8811d4b26882ce406d61a2fcc74244cac95054d0f85b8d4f317c"
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
