class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.577"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.577/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2bd1b7c284ccbe95193582dd2570bfa0e5d63dd13d47622e88374309f1d92161"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.577/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c899c43e2afbbc4e502aaa9605d569453a4673b2e5c04e3d60dc49765045f31b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.577/gal-#{version}-linux-x64.tar.gz"
      sha256 "bab949f01c06572831efdead45561c3e08a7591ab927526efa66b0c6f080b27a"
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
