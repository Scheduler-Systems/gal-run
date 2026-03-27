class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.383"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.383/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a4400b47bca16e873419b56eeba66370f911a5362e4cb3cc5c78835e5e0a53d7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.383/gal-#{version}-darwin-x64.tar.gz"
      sha256 "119752550cac6ea8b0aca90bd817cc0eb39ed0e49ea257bd43103b14d8926438"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.383/gal-#{version}-linux-x64.tar.gz"
      sha256 "181a64c762f18053657bad365aeec6a155686bbd66b223600b9b4c02c03bb28b"
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
