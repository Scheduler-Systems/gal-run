class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.325"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.325/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a569a92f2276cbb2235b727c1056fbd8836afa795adadc96a223a6dbae1c2162"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.325/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ef27e7adfa9c0d9bbd64363435adffb1296ab7b41a00becdbc51c5d1ea48bce6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.325/gal-#{version}-linux-x64.tar.gz"
      sha256 "4e4d997b848fd6683b977923b1d68912a8fcdb14057dc3989bfb87eb4e844d2f"
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
