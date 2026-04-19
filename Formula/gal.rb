class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.603"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.603/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "94717a440c6c2d182d3505fafd1a92b571039b5f2a7d5d2a354dcf6845100e8f"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.603/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b69f5bec20ea951a4fa7a048ddc30a3e765846ec5a042c5cb336f6d81ab8f6ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.603/gal-#{version}-linux-x64.tar.gz"
      sha256 "dff3db662ec59e3ac9afade9b55b8ecf1917e6bdeff144a1bb1ccf0be09aa421"
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
