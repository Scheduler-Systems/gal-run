class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.397"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.397/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "04c4be78b94480d73a26de0099d6eac11a21b8851cec1c22f28fb5db2bc5442c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.397/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c1362f7ce9b48360d35fc3db38d7c0a16e761f171cb00c30229ea83f33bd2186"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.397/gal-#{version}-linux-x64.tar.gz"
      sha256 "8627362f72cf50a5e0b62f57ff71f9589af867f608044af39fe4e7605a4bbb66"
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
