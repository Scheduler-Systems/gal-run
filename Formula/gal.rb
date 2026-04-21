class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.610"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.610/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "061d808d3e47e2c3b27406ee0d6603e5287a82bbab897bcb822b589c9e2de70a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.610/gal-#{version}-darwin-x64.tar.gz"
      sha256 "da6c166ecaad65f3629bed58ab4887809d6a970c650ff0e95cd0ce698912f332"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.610/gal-#{version}-linux-x64.tar.gz"
      sha256 "74eee2d9e3fc13404c96e74b9291af196c1898d509c96be60fd260df34e1b1f8"
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
