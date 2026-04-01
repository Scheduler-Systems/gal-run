class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.519"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.519/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "5560040369aeb66970cd179208ba552a8e3d675a2dc5f5523a3090e28fee53a7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.519/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6c98cb95849f416a2964794ca8d1d8981bc875d8d21e6091929c1dc1f42722f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.519/gal-#{version}-linux-x64.tar.gz"
      sha256 "b9d2b1f4b4acfbd25ddc5af41f1003f6eefa057d19d6505e919e02bcff6927e5"
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
