class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.448"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.448/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0b3fa8d7b74c715d33ed718aa4326093c25b198ad9112a27bdbfb03f5cdb0801"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.448/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b5acdd91a7a1b2213989308002b5b72aa6e06976e32939ef9837ee087bcb439a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.448/gal-#{version}-linux-x64.tar.gz"
      sha256 "aa1780ffad530c47944b113803a06344654cad9360d5e1de1201014cb11275f6"
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
