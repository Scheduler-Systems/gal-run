class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.572"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.572/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e3063318a77cbcb6420197fac7e56f38e0a19275424324b9039cc2507e05b16e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.572/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6ab413c76a3e57ce8c19f15eb0c64e01a94114249d599bfc222c719b7b49094b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.572/gal-#{version}-linux-x64.tar.gz"
      sha256 "5236adbd8a3c41f8fdbeb1cad26f1dc4d2a3556ed6e7745102b5ce7b4c3e2fff"
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
