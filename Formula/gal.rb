class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.423"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.423/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "bfe57d9ca78e3e7f7bf37ffd8a10425cd8b323106fda25f0e8a6a2a1842f0716"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.423/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f526b2864c205f070a90d22be2458ccf32cb3df4f8f5ae6dfe6c092bbdd86228"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.423/gal-#{version}-linux-x64.tar.gz"
      sha256 "c043152ecd0e499175cd82763f7eb9541ffd74acc114049f27376de9f6979988"
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
