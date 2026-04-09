class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.561"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.561/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4b7d7531824f494887694d2b2415fb4d4de7048a39fe6894006ef391ff2678f9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.561/gal-#{version}-darwin-x64.tar.gz"
      sha256 "605fcb2c70a8e5bc38b1a8dfafb732ec4d8e1202df993a848b31a3f50c2da2fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.561/gal-#{version}-linux-x64.tar.gz"
      sha256 "5c4cd2abcf8936b3e735fb6dbef5fa28d02ae3805d85867a90a19cd65a3db9ab"
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
