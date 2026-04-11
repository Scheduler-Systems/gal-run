class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.567"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.567/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ec09ded5bca691019d98b0a8f935e650d3896955922c85bad26e0e84e77d222d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.567/gal-#{version}-darwin-x64.tar.gz"
      sha256 "56414068a72125c460bde1361bc25b7530a5e508e51c2c80a3df314d02689e88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.567/gal-#{version}-linux-x64.tar.gz"
      sha256 "7782d72cf61549f5d2ce321d3f24d19a99d2f87aab43a071c9e3049fe5e2b805"
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
