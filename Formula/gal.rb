class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.589"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.589/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6e836853431f8d0de08c0b743d98e159c0da80d1a0e0ff7ac72984b9c7a4a37f"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.589/gal-#{version}-darwin-x64.tar.gz"
      sha256 "40851e37e05588697ea38f720afb0700210ba05a5b2c64312379979f82f8a4ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.589/gal-#{version}-linux-x64.tar.gz"
      sha256 "346e9a8a69be2112eb2754baf90e903f0585a9d085a8f306ff5566dee61c04af"
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
