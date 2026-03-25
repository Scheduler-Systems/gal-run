class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.340"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.340/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "94929e164939f1785b7afb043cd5ccb13f153f2a26965eb336194929c38ceb78"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.340/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3e31cc33b0cc4bdf73b091d0296b8a71b340ff6ba8f9d1a0a2eb1119f82ca383"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.340/gal-#{version}-linux-x64.tar.gz"
      sha256 "57a8acd501306a0a6e903a8ce9f22da9048cef2a35a672f32e3350519a59c20f"
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
