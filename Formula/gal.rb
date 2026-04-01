class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.476"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.476/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "9a5bbc3dae433095586802f13267adb0529b480344cf3f28e84d6cd7929d7277"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.476/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2a8940e5ae6cbf2134795db53634e2a9a0c5f7f87e91b025b6359615639f6565"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.476/gal-#{version}-linux-x64.tar.gz"
      sha256 "8f083fc501466a32c50e901c61a2de8df8fa78cacde246acb104d8598bd08cd2"
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
