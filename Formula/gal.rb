class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.317"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.317/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8a68e587f5b348985ecaa3a10f4cf878a238a2f7b83dac5a9f36d137a633e561"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.317/gal-#{version}-darwin-x64.tar.gz"
      sha256 "44db957517fc7536eef635bb5cbde2dd92e262e35dfcea30ed11ad9f7ba00a93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.317/gal-#{version}-linux-x64.tar.gz"
      sha256 "449344f66676d1ff2537d71493f6d5b2dae932e908744c8ab60d7dbdf6518a3d"
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
