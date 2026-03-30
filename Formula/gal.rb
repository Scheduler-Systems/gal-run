class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.431"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.431/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "fb1859133894e671a76a901b274da5bf3f991b830d7b5edbc96f354bb9acc7eb"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.431/gal-#{version}-darwin-x64.tar.gz"
      sha256 "db521f0ad6e619733b9da1ecd534932ec7d3a50da9dbbf2a0627121a31764c91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.431/gal-#{version}-linux-x64.tar.gz"
      sha256 "388a961269156cb67ffa98e52db0543fa56961a7841487642e7f17b001166e74"
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
