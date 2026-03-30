class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.421"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.421/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "94e2ba8bf4ec19b866fed4b4d85c2863e1b327bfcf47bb1cc963d487fa090bf5"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.421/gal-#{version}-darwin-x64.tar.gz"
      sha256 "68e05560074f0da23f91d3225b56b94e03cf86162d56b5523681954f2070dbe5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.421/gal-#{version}-linux-x64.tar.gz"
      sha256 "86860a2f9e9b43589e83e2d6134873a263a780876d31d1304400398e37bc19ca"
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
