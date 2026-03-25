class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.337"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.337/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "496ae3d3d2540b069c3f9b9f14678b34952a018516889b73d3e1df842cfa9bc6"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.337/gal-#{version}-darwin-x64.tar.gz"
      sha256 "cdda115f1295a5b5796f58a75143deefeb420e44c4af5539b81c03990ba97a2d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.337/gal-#{version}-linux-x64.tar.gz"
      sha256 "c25e71f40a95d6af7da2d96186dcd230c3abf4f01048285b64f0552fb787cdbf"
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
