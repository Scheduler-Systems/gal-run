class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.599"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.599/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "342aefd159fa7796ef2cda3b4be119e525b0396fb69097c9968e988dea3e3582"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.599/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8f8e8efefc1f4dfdb254b674719b840f1af05e7acdf2fb132a55fad0d8069d91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.599/gal-#{version}-linux-x64.tar.gz"
      sha256 "0ecfb9f5d947b5a5881fd8d0d217f5f21595a3a3c643ad00539f550be039c8d2"
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
