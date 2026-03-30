class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.430"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.430/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "30d60a3ea293330ebb15165a70dbba0ae2d005ab1bc38ae8e708afb57d03fb7d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.430/gal-#{version}-darwin-x64.tar.gz"
      sha256 "70fbb2cbdb3064f539860ef5f1b290bf56692df4595b1f3116f332955d28ea30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.430/gal-#{version}-linux-x64.tar.gz"
      sha256 "fd36192f6f4523ae9074b55a78c38e800d56a556e5d449975992c3855025b072"
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
