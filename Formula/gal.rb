class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.481"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.481/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0719242701deb658ab1b96f518d227beb2c8cd1c9c002c6f56fe07e591934b4f"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.481/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f8455824659a5807168e77399d8c56285f522161016043bc2f566032458c1154"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.481/gal-#{version}-linux-x64.tar.gz"
      sha256 "04baf3aa6a8ee29903569ad040d6180950ca0c5c5af4401cf0615cb8a9ca2e2b"
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
