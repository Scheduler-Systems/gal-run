class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.442"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.442/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b9ef8bab0aece7756927bb79e6c1e4d8ab6bd5ab7cc0fbe127fc060f87690d5c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.442/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4738d88b9fd3fcd7656f2f5f2431a4dd00d0bf1f5304cb9e0a02dcbec57c241e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.442/gal-#{version}-linux-x64.tar.gz"
      sha256 "531c4514404f550988954861b2448c05ddd2448f20e0b0aec7d55a74bb55a996"
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
