class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.330"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.330/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e35d51738f78da66796617ab0e26a3eb75ec8adb1e5c0a078707b6df5cac5363"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.330/gal-#{version}-darwin-x64.tar.gz"
      sha256 "e146a638965901b110e5ea198e958129c75c98c16c250bed77fa7d1128242187"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.330/gal-#{version}-linux-x64.tar.gz"
      sha256 "2e34afb94c5185d9babd22f22d3af8e8db581b0b1b0d573c73ee555c24d6b495"
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
