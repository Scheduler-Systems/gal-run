class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.444"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.444/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d0dd82f9ded527a96f54af5879c824dce04796f52d5af23a4f1248a397099b69"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.444/gal-#{version}-darwin-x64.tar.gz"
      sha256 "053a617b0684b2dbf5e5ff1a5c46a14c1b7b6e6848a75ad8a4cf92047973b1ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.444/gal-#{version}-linux-x64.tar.gz"
      sha256 "882477c04cd61c4c51e6563bb72de0c19e51a6848ca2a886a54d44959816540f"
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
