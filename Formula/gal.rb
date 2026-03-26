class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.347"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.347/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1be1298d285f98ad3cb310e46a066be88b114c6bbc36ac8784b11137b26dcc95"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.347/gal-#{version}-darwin-x64.tar.gz"
      sha256 "92faf9cde44a5bf4cf7cd33de70b63fe6b6229f7b0c5d5cd59358e5c5ea049fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.347/gal-#{version}-linux-x64.tar.gz"
      sha256 "4e9896b195139ba8f3716b41a536b06536a3558e546759bd963a5c85d305db43"
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
