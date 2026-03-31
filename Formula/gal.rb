class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.460"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.460/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b30f60556339299748f4ab6c0b7682a498a7edea16cf47ad31e02bd999bf2253"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.460/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0393dbda3517d819d3fa36a104543ab936d183766aa9346055efd4f6c6cd1eb7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.460/gal-#{version}-linux-x64.tar.gz"
      sha256 "a1e1cef9309a9f125a28f310bb684fb9a4c534f67a5250e2631bc8a3b23059b4"
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
