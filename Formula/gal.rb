class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.528"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.528/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ad44675e8b924969a2c295d31e05cf4d4cf55eb628e52d940cf40c1c0acd5799"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.528/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2f0ff31683e4028223b1cc61cccbce07c2f3a13cd64480f0b133d7f95db3fd46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.528/gal-#{version}-linux-x64.tar.gz"
      sha256 "c7c3052b5c73ac1a002dc70f58a6952dad39ee65b60e07f07f0ca65874eb3f7c"
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
