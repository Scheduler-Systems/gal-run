class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.571"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.571/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "f63ff850a5407d163f604a128f7190915621acf96150d0ec6d2adaf31ba8d35d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.571/gal-#{version}-darwin-x64.tar.gz"
      sha256 "10a9565d8eb30185ade1c93df54885c2e410d6dc87fad4024f0f54953ff8e28a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.571/gal-#{version}-linux-x64.tar.gz"
      sha256 "5affc7375bd9fb1192d552138e3e1546ab58080f263840b1f4bc882f755de179"
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
