class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.516"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.516/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "dde45e012989f89ae82b546b9b63b908a14f664549925bd26de85e97edb55e7c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.516/gal-#{version}-darwin-x64.tar.gz"
      sha256 "23d35ec360bf30a594692f198fdf1b9b77b961a53e3b05106fb965d0493e56fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.516/gal-#{version}-linux-x64.tar.gz"
      sha256 "9968b519c67263947e2281e5fb2e23c130c6379b2a2b6508b42ab6808ab1cca6"
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
