class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.391"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.391/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a49a71c58a2a93fabcce9762f6109277ff79fd7f726d9c22dcf67aaf3ce2c0d8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.391/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7e7531874eb0e990ba8166d2600375963cc64a76de3e8b742cde36bdce26032d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.391/gal-#{version}-linux-x64.tar.gz"
      sha256 "c9cc590dea7bcd45d1f33c6b4aff181a4400d5877e667191c68a094eb15086d6"
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
