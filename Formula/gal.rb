class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.575"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.575/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "943f5e4746bec00888da05a4438dbf0283ba0fa94fc6ba1d72f5149612b3ad3d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.575/gal-#{version}-darwin-x64.tar.gz"
      sha256 "19c5751bc1b319274932db6daf49e4979a9c26a70d4209a849737fa2ad986ad9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.575/gal-#{version}-linux-x64.tar.gz"
      sha256 "6c8035f964ba324ad5f6b69aedf8d95ce595e1a424ec0a99e4dd6e63876e6acf"
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
