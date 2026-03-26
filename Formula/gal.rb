class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.350"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.350/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "f8c2d9ab24b695a6136b0f8b30e764898771f1131b4285475bbdb0d3ab46a5ee"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.350/gal-#{version}-darwin-x64.tar.gz"
      sha256 "90301511a05ffd4be5998c94aa1a623749dda16d151b1a998afe3fc12b523051"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.350/gal-#{version}-linux-x64.tar.gz"
      sha256 "c8836ad7fcad650a5d369a4c729306b4ef2a6942b507bda732e1c5d7effc5c4f"
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
