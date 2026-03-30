class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.426"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.426/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "3c4253645b31ceec73c97320df62245e584953bfdf8f2dc1332a3a29eb80e481"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.426/gal-#{version}-darwin-x64.tar.gz"
      sha256 "679c372970deda98218ffc694b2a07e7aef4b2108d691396a4680efd807e983c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.426/gal-#{version}-linux-x64.tar.gz"
      sha256 "7711a91306ea21ff985caefcb3a49585dea9e123b84b86ff6aff2a8fab83a866"
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
