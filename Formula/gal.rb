class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.569"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.569/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "3eb83b6d4c424258167a7ea1ea8d71672a67ebbccbf0ba50b96bdb8f5b0910c9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.569/gal-#{version}-darwin-x64.tar.gz"
      sha256 "29857b5e1619d09f11bb2171abd686ca4586b20425339daf9c5acda8659b1542"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.569/gal-#{version}-linux-x64.tar.gz"
      sha256 "9b359217f695ed6d63d7aadaafc74947c7bfa8f3e337228bd4bc9139407f4646"
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
