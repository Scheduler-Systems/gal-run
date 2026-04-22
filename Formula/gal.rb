class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.597"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.597/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2eb394f56c9dd27263790df9ba19b5349f7525f2d5fa1ae08bda745d7a27218e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.597/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7620021aff80f2057a1bea4872334dd115a48f05502f0692b2ffcbddc2409524"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.597/gal-#{version}-linux-x64.tar.gz"
      sha256 "a55a4aa2fd10a7b863ce08e4fed517d5d7b765375ae4190923a998df428c1c4c"
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
