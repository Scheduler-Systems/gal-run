class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.477"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.477/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a9b559fd46ef5fad5f7ce3172b47b2e842d5758819e7253f87fdcf676dd71f0b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.477/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0795838d6614a5c52d2fc3f8e6d8d10ae232a84c49946d51e83c9c038eb3c333"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.477/gal-#{version}-linux-x64.tar.gz"
      sha256 "ea3fbef6f4177a6cce55fe49b4b9fcfbf795023d64723b715a19a8637a9de769"
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
