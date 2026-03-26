class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.351"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.351/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "30e1b2ab636c26ea6efac0d70cacfa08a9f9f07e3fdb78b5dea398cc06da26c0"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.351/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d60b6f49f10c172e3c02635c6b986e39d00be72974b806a6714f5dd74281f4af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.351/gal-#{version}-linux-x64.tar.gz"
      sha256 "01fac2aa7aef26fca1b9df759b6d53de0b82fde547d58b7d0bcab92a96ca9150"
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
