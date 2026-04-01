class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.513"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.513/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "bde8fd349673d8185ff20ad0395f4eec76d9e5409e5ff840321eea0761a0f6df"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.513/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0949ab2fa408a812b9ab49b885f46b0b9e622a168314819caf8eb02a14964ca7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.513/gal-#{version}-linux-x64.tar.gz"
      sha256 "03b405031f5facf0c84c06d767a6253b53e131dae7ca2f335c97ea561afd99e2"
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
