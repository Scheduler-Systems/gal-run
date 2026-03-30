class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.446"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.446/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "cd0359d7a6f66ad3cc0423130ce79a36bca872c4ab7b68fa546c9fd300fdc4f1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.446/gal-#{version}-darwin-x64.tar.gz"
      sha256 "5f0e41a04921e8163a7085f0e189d2b50042eccb258eccf5b5740107e82f8d10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.446/gal-#{version}-linux-x64.tar.gz"
      sha256 "9039e8e6c6a161a5c16c9f89107de8cb28118bc1c8c072c3610f44bd7149d3ae"
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
