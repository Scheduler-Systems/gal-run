class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.392"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.392/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "96c6edeb4aafb0ee3f17017366ffd4cb176142add92662ddf42fa04c84cd25a9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.392/gal-#{version}-darwin-x64.tar.gz"
      sha256 "a7efb7384bd4a7db79765277076a8c2196c9d91879cd8b1adee536ae599333b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.392/gal-#{version}-linux-x64.tar.gz"
      sha256 "c98960755e97593906eb0f709f8eb5c536a597f75cf4a4cafe5615eb2ba8427b"
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
