class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.429"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.429/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "5ba9992b9bcd021dcbce93a02d1f1bec27caeb087bed3477d3443fbc0e09ae53"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.429/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7f76dec392861c4746b1d57cf83ce3bf2493d13628f6ec28e7e16dc33a7fd5ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.429/gal-#{version}-linux-x64.tar.gz"
      sha256 "b9a6d53b9ebe95d79551593ba6c79774c6a07e06a7eb31b3b491a2c64d58c646"
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
