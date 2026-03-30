class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.418"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.418/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2f21fe92a3ebbe531c2be13b7858be220dd2de63d6db054d4c777339415dd13b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.418/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0848f3141c609a0dd29b8023ae8cc0bf1218d4fa8ba47b47b85329f9ac1b5d18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.418/gal-#{version}-linux-x64.tar.gz"
      sha256 "eba5403c89dbefbfdbd74a463f0af48c53a1863f1d3b5ea19c42eaf026a35fc5"
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
