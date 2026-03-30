class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.454"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.454/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c5e73e9f53006425effa028d4700b1296743fdff00ee968c20515e0caff3b116"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.454/gal-#{version}-darwin-x64.tar.gz"
      sha256 "06095c6c3a87d6092b436747a03283b48bfee33c2afc8b9da20755ca53d85db2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.454/gal-#{version}-linux-x64.tar.gz"
      sha256 "dcf7b190404287e312eba00ccd230335ff8fcff639d07e80a0f365f4543eaaa1"
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
