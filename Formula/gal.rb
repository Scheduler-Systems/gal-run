class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.380"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.380/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "bc5f3f485f056fef9a6789190917a71fa100762bca7e85b2da6846503304731a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.380/gal-#{version}-darwin-x64.tar.gz"
      sha256 "50e2872e5943274f863213c6fde7d85866c99f6d8fff0daa2ef57fb2fb2d80b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.380/gal-#{version}-linux-x64.tar.gz"
      sha256 "c3a775d3ec0fd09bc75f30d8dfcaad6f68d197a5dbd8bc2d9af3dc62f65b9eb9"
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
