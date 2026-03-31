class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.456"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.456/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "bd3fc36a05cd7b00e084f7e8e75be11c4595984a96a22fe38b8e94c3e75e332c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.456/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c102afd634eaed1a5d35e5ca48fee6ac05ebb70a68b6aa859fb75fe55930b658"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.456/gal-#{version}-linux-x64.tar.gz"
      sha256 "46b993afad0288c1e176ff140415331d21d75d0bed7eb3e0831bc93b3fe6f8e5"
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
