class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.367"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.367/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2fc18e8ecad7c55490bac3b0d5e34aab2f516fb83c711c98b8478ef2bded83f6"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.367/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ff4d8ac696d89d75dbf68a6417f67ff10bc9eb95c00b5942b495e4491b4f7341"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.367/gal-#{version}-linux-x64.tar.gz"
      sha256 "8ff1a81464b1cef2e38f8b05c1c26905218017a6477d247e57ee095e075068c6"
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
