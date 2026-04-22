class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.628"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.628/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a8f226736d8b6059b880f85a5fab18807d75093291fc3d6186df4d817380cd3a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.628/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4c4b64ebf76ee28e3c9371a8f4b268b7759d58a2a0a0bd80049055542b0cd18a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.628/gal-#{version}-linux-x64.tar.gz"
      sha256 "edae1eeb1a6cbeda3ce60db8f1b16d402fdfcfc717ff89699cf4612aae461f63"
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
