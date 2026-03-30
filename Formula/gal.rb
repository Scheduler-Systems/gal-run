class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.436"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.436/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ae8a6d65c5a25eb3b30b49ef1e0306fc80fedcb25be830eff2a75ee23acdcc9e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.436/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f59b92580eda207675a285021dc60b693be52b8753f9ed95bc34163c3f3dad10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.436/gal-#{version}-linux-x64.tar.gz"
      sha256 "a0fcf0231d56c6f6a0330d4c41d5f1c0f92c77c75f29ba400bf7804ed66c5b17"
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
