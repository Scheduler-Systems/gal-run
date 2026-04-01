class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.488"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.488/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ff04bf6a836af6a6a8910524a833386f554291b35ac48d1d4785d6071cecfd6d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.488/gal-#{version}-darwin-x64.tar.gz"
      sha256 "28cb43267e5cb3ee274fc31f466ae0b9f2ef80d6a73f3bdbb47b9954587f6189"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.488/gal-#{version}-linux-x64.tar.gz"
      sha256 "4926bd1c902752e4e08b7bbf5a3364130590ac2f0f61345c637de4ef6cb68d5f"
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
