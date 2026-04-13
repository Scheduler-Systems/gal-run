class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.587"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.587/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e706716f2bd7198db40f1c2ea3a6692d3356bde51921227337b162a2e0952b72"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.587/gal-#{version}-darwin-x64.tar.gz"
      sha256 "51688b2adfaf089e116826978bcd0bc63c3feaf7fd0505e6b0326143b67bfb83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.587/gal-#{version}-linux-x64.tar.gz"
      sha256 "77693b0a0937153a44835f1e40e1a396c7ff6b6617def65d28e8bd8891e763a5"
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
