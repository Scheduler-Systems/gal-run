class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.609"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.609/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4e03c61c06021304896332181aa349332ff54313b6670f2d5a8dc06bd8bf50e9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.609/gal-#{version}-darwin-x64.tar.gz"
      sha256 "5d2f64be704e1d815c4092d919b78476676b53f0b2b55da583f98f548aa05063"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.609/gal-#{version}-linux-x64.tar.gz"
      sha256 "a6ba31506efd5e311999153615fd8d3e1876f3d718f12824ee97a03307dfb9de"
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
