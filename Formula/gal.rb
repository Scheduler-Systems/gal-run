class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.483"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.483/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6b3255612c5d0146582dea682a174e840a3727e88f9f738ff1802b4597c75be1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.483/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2d9a62384c3441ff0275b9d7af38c45596fd82288553f3602483410dcee8f1d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.483/gal-#{version}-linux-x64.tar.gz"
      sha256 "c3305c05ee731871c4cd40cba99c05fb1c8980bfd38a1920134a4b26ac1031b8"
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
