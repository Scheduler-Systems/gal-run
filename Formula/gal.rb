class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.660"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.660/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6eb3ebc4c24076a8de41023d7337db5ee8a3fcc7074c58315d4d4f2e1af74b20"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.660/gal-#{version}-darwin-x64.tar.gz"
      sha256 "cb3d7155431bee3e5982867176443877f4096fb097e22d2bf263d82ac084a299"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.660/gal-#{version}-linux-x64.tar.gz"
      sha256 "e164ac82b0f7dadb6511b8edd5393d8bede410d931935f9eb624ccc79d0cf46d"
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
