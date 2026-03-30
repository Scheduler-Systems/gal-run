class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.433"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.433/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "622b2c753249bb493d7787afa2ba9ff132b801c0f6ae2e3b6582f3b148541d39"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.433/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f925b2f3dad867394c7238e0cc22571194ba1e7b852f9a918bfdf23490283813"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.433/gal-#{version}-linux-x64.tar.gz"
      sha256 "4119cf3fbd1137fdcf046d66d63ae12f7e717248863b9eb2a0b41c536f675413"
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
