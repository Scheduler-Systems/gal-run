class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.338"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.338/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "286a44697866b29a6c64463d9e919ffcb95399b02d513085af5479da64ebbb8b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.338/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d6967e176a2427d38a9fbdfb13cf68fe3c26f366c9ba1772175c272f93c3167c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.338/gal-#{version}-linux-x64.tar.gz"
      sha256 "62a8cc6db4dc9cd3921ce270dd481e120d7c678fdcda472a123c3eb9b317e406"
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
