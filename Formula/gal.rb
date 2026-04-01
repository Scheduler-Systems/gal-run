class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.498"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.498/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b00b21ffb8ac51b567a066bbae3e8d8a32ae949f9628cb43d94db9f59dc64aca"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.498/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8d0f8e81aebcd252a966ff02a73fa7980fdd1d1b423e92dc562bb4fb781fa0e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.498/gal-#{version}-linux-x64.tar.gz"
      sha256 "3e2ec540ddba25f0aa29ea6020a3a6412a039148c7171dafa8afeb5a0433e14b"
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
