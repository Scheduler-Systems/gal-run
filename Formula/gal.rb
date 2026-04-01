class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.474"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.474/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8d475cf45c293f3f5a9fee86a65dd53d1ec7e8e8b67f02063180c129e8686576"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.474/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d25254aabeb7782d1c3f2ed090aec597cd427ff331ac8dde57228ee2d17aba52"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.474/gal-#{version}-linux-x64.tar.gz"
      sha256 "4fc286d25dd45e749663a75bfc52d2ab4c691821fb82f32e1ea0fa0442dc6c17"
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
