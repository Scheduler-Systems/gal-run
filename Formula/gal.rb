class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.215"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a9806644f5c4a09d62bb21c3f7e29e0aae0c850d8c664d337c9ac74a435e7a75"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-darwin-x64.tar.gz"
      sha256 "16c03468a3701eea09b7bbb752e6de4d6521d09f2c86a0a8c006b4da695da752"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-linux-x64.tar.gz"
      sha256 "f71df88dea8d27cf55d0af4482fe2edace689745491da9cb0f8c5c69de479b46"
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
