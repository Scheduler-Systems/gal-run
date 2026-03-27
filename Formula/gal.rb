class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.373"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.373/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2889f0b4bd41d4ea152c5dee29135ac1103fd26d0debf029e6c4f07583af2aeb"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.373/gal-#{version}-darwin-x64.tar.gz"
      sha256 "9c46aca590a02595795348db6861e02a2e7d34eb02a984c143cd8434b7472ae8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.373/gal-#{version}-linux-x64.tar.gz"
      sha256 "dd98ed2a7c0a3309852a4ac26604e5444a57452fae8301751eac460fc5c527b2"
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
