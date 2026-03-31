class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.470"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.470/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4983a0e17852cf4b2e3696c63168e6b093e8c74916d10000a5b51d130047bafa"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.470/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8c9b07779be1f6a6ec5bf6665bac872f223510298d083328f797a64d3f99422c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.470/gal-#{version}-linux-x64.tar.gz"
      sha256 "c63b8c974772aca16a5a69e814b810343f4226a609ff71dde607637148371b9d"
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
