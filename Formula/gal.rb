class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.277"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.277/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "bfd1057d267f224f95b4371beb90830ed842f30ea2f573e12260b9bda93264b9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.277/gal-#{version}-darwin-x64.tar.gz"
      sha256 "1deb24d19b7bfc29abbff988b69fdaa9a8cc95f16af081c3159749f4a97c4048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.277/gal-#{version}-linux-x64.tar.gz"
      sha256 "5154945f3e97919d0a4ccd51e857bad34bf9b4f4b6f861def809817c2281affc"
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
