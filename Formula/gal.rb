class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.557"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.557/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "fae1d0725a7c439ab0c7d97120c6f6a80d1e628037ebd79e0a0c7ef6dfe6d7f8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.557/gal-#{version}-darwin-x64.tar.gz"
      sha256 "132bcaf0850dd9ee26887d1208c1bb3e6813af70df83eaab2faf3d03e6460e1c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.557/gal-#{version}-linux-x64.tar.gz"
      sha256 "a0c6cb50ee20b7363ecc949873710b64eca7d140761f1818d5cc9a6778967643"
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
