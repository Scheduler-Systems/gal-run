class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.665"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.665/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2c23e59351a8e3d9c4a1ce1d6b83a5700e093b9527b5a32d93381f694c7c5290"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.665/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ffec84f7ba1819141264a9f2bf9f541613bea69ac76afa8d92515e01ae3b4e53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.665/gal-#{version}-linux-x64.tar.gz"
      sha256 "7f3809bf7f4c530bb5c1b8a86b4857d32c251476aa1d801ee105c2c57c114191"
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
