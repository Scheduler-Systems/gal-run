class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.323"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.323/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b3f95bda139251bf45915673f9fa8c6ef46e8dcc46c1ef1c8040c4cef3446440"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.323/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4a05e49e6d9a8ff7873ffa216bf46f1214c169159673c29e916901081f3f5bf0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.323/gal-#{version}-linux-x64.tar.gz"
      sha256 "0604d2577297a535031326e4a913286e145fa7a9fc0139ef35c9af140af68e7e"
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
