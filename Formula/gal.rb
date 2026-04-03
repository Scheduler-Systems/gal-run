class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.543"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.543/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1209baf6e27ad33c8868c267c40e526de906082a8a440872922577997d7d2967"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.543/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0890d1d0444347a56ba841a58b1ef40ae17e8c05bcc515c2f669bccfe5c02d64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.543/gal-#{version}-linux-x64.tar.gz"
      sha256 "9938d78f3572c28753c4aceeb9d403ccd2d60170c87bc1d55a89a2c2bb9c31b0"
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
