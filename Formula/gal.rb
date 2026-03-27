class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.387"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.387/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "319057e8d01bcb62bb009a89a6b62d59b9c89a0e203c2c1261457fbe79973f7c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.387/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ccae1fc01eee613af2d2568d3c52ba1e415fe4983de37938f192b4fc9d588239"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.387/gal-#{version}-linux-x64.tar.gz"
      sha256 "29d4754a16b7d5fedd8c191e11223397b5b02bcb95c9d728ca90bfdc951469d2"
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
