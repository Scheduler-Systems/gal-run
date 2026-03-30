class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.437"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.437/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8f2c749e8873e0ef5e2da7b58f954fbd6439068dda69fdf6c356172fbdeca344"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.437/gal-#{version}-darwin-x64.tar.gz"
      sha256 "872610d181ec3c28c012adac3fe151c4db6f97a7fcbbc889f6c4bea131a15b77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.437/gal-#{version}-linux-x64.tar.gz"
      sha256 "9e5ab738b084ca7f76faa33bb8d807e712ea59e3f34853e4f39bc8e19086b751"
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
