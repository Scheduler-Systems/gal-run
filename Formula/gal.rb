class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.393"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.393/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2f7d0ff60caa70c4d6afec8075b8cf3541bfac20c825706eb903e2d0f75e6806"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.393/gal-#{version}-darwin-x64.tar.gz"
      sha256 "307927ff28fa97e6c4d175e17a5cd98a26a1d1fd5b3b7a21bc2361320bfbd8fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.393/gal-#{version}-linux-x64.tar.gz"
      sha256 "08fe8eddc5fc7f304c20d727360f626dee90eaf05014f5394da54452d876e36f"
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
