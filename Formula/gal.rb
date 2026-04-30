class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.664"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.664/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a9be16971c9a95c5ca44a31130536ec90b47f138c35af3a28d96a4b947a3a335"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.664/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ed771cc0203d0ba12733dbb22614a107e654fee5628c0ce60aa8752855eacad2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.664/gal-#{version}-linux-x64.tar.gz"
      sha256 "cbe58a4304f14c05c95468fe0c9c41e30553a61a47e578fa3e1e15de5ce009a0"
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
