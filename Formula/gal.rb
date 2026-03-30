class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.424"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.424/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "aa4f788344fcdaccc82872247ed5149dcaea8b888d1604ae9f0ba4bb839c595a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.424/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8f360c67c22cbeeb004e0cbf5851d454344ed5e7f9b988ec0d4a50a79b849a2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.424/gal-#{version}-linux-x64.tar.gz"
      sha256 "38f2b5e04b51af0445a009771d0722eac6d24b9581f9b9fbc778b9276ea978de"
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
