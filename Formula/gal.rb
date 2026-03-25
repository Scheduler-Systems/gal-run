class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.345"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.345/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a53c88d4f7ac0eb5cdb3f3c7e797961f8d7a6451a7630f1463379f1d6f23c831"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.345/gal-#{version}-darwin-x64.tar.gz"
      sha256 "428dbd955c65146a4965f188b3e7f0aebec0ba82d0b2c8c546d2b98e9dbf10c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.345/gal-#{version}-linux-x64.tar.gz"
      sha256 "14a0f4e195dbdc4e886df69a91831fbb437069c08bdb09f7a29ab6bc061427cc"
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
