class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.315"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.315/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8fe3d2994e307610ed3f7a4ce2b17442b988bcfa27fe4a836be12999040896d4"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.315/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7838317dd01b0390e3301f4377cc49e054c1cd483ab55bee7c6ab0f1f8c69c84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.315/gal-#{version}-linux-x64.tar.gz"
      sha256 "2f51a2d8e398434913769615485d0a87a72750a1d0222b47c908e850d67d9a33"
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
