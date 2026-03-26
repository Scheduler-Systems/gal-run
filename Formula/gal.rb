class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.366"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.366/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e3c7afb6eb0bc721dbd0a9fa43d99dcda6a9676515fe8c5696663364fefb1026"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.366/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0ee53b8605a5631249429adbb80fec728f241da07bae0af2e23caa2628035fab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.366/gal-#{version}-linux-x64.tar.gz"
      sha256 "c9de0024d4506602f17d82df5bf1451a1d05b39cff7d9fcc92a05fb6228b81c4"
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
