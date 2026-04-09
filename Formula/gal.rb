class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.562"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.562/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "aeb17ea4c15c19578ea2f68f640e783ccb80206bf25d6a15382c3c7bf2702ca2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.562/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0960f3701d9b6be99ee934fe54f595b41965af0ae9e4233597c33c3bc79fa7eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.562/gal-#{version}-linux-x64.tar.gz"
      sha256 "aa07a3229b0bfc8b2e2ce4139f19ce32bf8e41c2906cf77f6cdd69e283083e0b"
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
