class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.403"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.403/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b351b18018af94b3c8850f02c39601596aacfd91076fef5fc9f8634888ee5c9c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.403/gal-#{version}-darwin-x64.tar.gz"
      sha256 "001a128e29692d894d7283f96db86338baf57d387ffd145499bf9e26e2c8ccda"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.403/gal-#{version}-linux-x64.tar.gz"
      sha256 "87bbe2e04473f992c078228cf327cc9053623a710d4b4d07e445ade246007013"
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
