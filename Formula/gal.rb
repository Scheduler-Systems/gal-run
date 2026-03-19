class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.316"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.316/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c8ddc9be1ff7e1cb279069cf220fc9d25d68449992812e020d582658415107d3"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.316/gal-#{version}-darwin-x64.tar.gz"
      sha256 "39fa3c492b9d8b05222d0c7cb3c2652b17083d57937073d697906d5624359c9e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.316/gal-#{version}-linux-x64.tar.gz"
      sha256 "d2a650f1b3eb54016987fdcd49056473200e2edc64e285024b50b087ea88af2e"
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
