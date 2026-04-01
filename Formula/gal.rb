class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.484"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.484/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "7997cbbdda596cc33206740528924f3302af76394a697fdb9b0229042e684b61"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.484/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c5aa4a4186b23d1877da0c08574893f07b4fe89699b7d66937e2bac30edcb5f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.484/gal-#{version}-linux-x64.tar.gz"
      sha256 "6b615a853625d565458598c7d138c7aa420d3ea178a5a733e2d9d1cd83615049"
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
