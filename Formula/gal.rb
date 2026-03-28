class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.389"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.389/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "227f305d0069526dd42ab4b81fd4019803b622e3dbc2dce70d7255bbe95a906e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.389/gal-#{version}-darwin-x64.tar.gz"
      sha256 "80742d888538d77b421fa327b50a111c2c899c8d7be1a4ab905dc7a7355e2eac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.389/gal-#{version}-linux-x64.tar.gz"
      sha256 "789378d10bb2657f131647dba9cdf659aca2c4db79d7a6ed2d394e9c88140b81"
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
