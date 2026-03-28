class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.395"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.395/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c7ac4ed8617c491bcdfb2a16a7ff28af884cc4a6420b1efbe92325aed96b7b1a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.395/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d032b61061bbe2d6ce897cd29636cf0f351eed319b5bdf37eb4cac4aff6ba1dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.395/gal-#{version}-linux-x64.tar.gz"
      sha256 "ec0af3eed8a35deeac8f1fded862bc9d98d8180e396f06756407a32ab7146962"
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
