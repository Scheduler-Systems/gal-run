class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.605"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.605/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1f1528b6b35e79d93c9d815a1c14d2531a4b45bf2ee6e9180be700831b456d37"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.605/gal-#{version}-darwin-x64.tar.gz"
      sha256 "24285e9dddd2200b77ff9c4ad7584b40bbbc3b66b6560330d3a0d4a935d4d49f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.605/gal-#{version}-linux-x64.tar.gz"
      sha256 "7bd6fa56e21e0a8a73ef189712e2861facb336684f564912af87c494ae5614ec"
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
