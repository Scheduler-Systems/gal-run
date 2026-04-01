class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.523"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.523/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0dfff8954cd911d919cd213ea47ca457b9336f3046509e5383b948f5f6f9fd38"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.523/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ff4a33f1784299a2cd0f5f89c8f9931c472379dc24aafa2300a1665aa1aa6854"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.523/gal-#{version}-linux-x64.tar.gz"
      sha256 "9efac12cc734bc22257e5065dc8f725bd362d2b3fc2da1a75c8099a6949cca84"
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
