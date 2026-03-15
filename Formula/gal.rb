class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.280"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.280/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "20f379c59338bf3cd8131f3362a222499b0c368394ee67104c1afa5b53f53663"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.280/gal-#{version}-darwin-x64.tar.gz"
      sha256 "557182587d3267f09a7e79670bc570da6709357811ad9b31fa608a28d1b0ae68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.280/gal-#{version}-linux-x64.tar.gz"
      sha256 "fa8ed1185e766a140433a5ea52c7b3576995b0259a9cb59225b639999f9ab8dd"
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
