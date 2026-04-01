class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.522"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.522/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ce00fc23e8926403a3fde3193cf45d74024151575924f75a420e7664ad628597"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.522/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c36517b1cf7cf28ce134c25916f4b52a18da2282ca7823a0b359bdae85c66827"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.522/gal-#{version}-linux-x64.tar.gz"
      sha256 "db913ba998e173e570c607376a427afc12c46b9d2ada3956fb947c2328111e39"
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
