class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.486"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.486/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a63597d6798b416433b07d07ac5309e1886227cd53189cfa79dd8ec052b8fc18"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.486/gal-#{version}-darwin-x64.tar.gz"
      sha256 "bb595b1348061c2b85071d1b48f7ff7f7ec1e757957b1fdca919fb3d84bcc8d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.486/gal-#{version}-linux-x64.tar.gz"
      sha256 "27db45aa1613f51f882762c51bb98d1a8d57b56ce60748e95075eb168cb023b5"
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
