class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.428"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.428/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c1a671cc50e1425a955d53d51d804812c3edbee139cfc016e935c99e81000df1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.428/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8d95a3c86b3bbdb61b87c05f811b31c6f357ce1b38877022b620fc0dcb22311a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.428/gal-#{version}-linux-x64.tar.gz"
      sha256 "24779d7662fbedbc80bc4e7004c93152db7a46da9002f6a54c732a1988a1c452"
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
