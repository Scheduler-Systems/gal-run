class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.540"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.540/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "f2d22a151d50d3cbcf4cc848fbf5ffe4b0802175d5da4b5043a0581e75d1ce30"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.540/gal-#{version}-darwin-x64.tar.gz"
      sha256 "bcd4bb7b9443fd7e12b56e672fde21c692d6a9e87ba147e180bf2efa4282e4b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.540/gal-#{version}-linux-x64.tar.gz"
      sha256 "f6f7dfb411a3ef4c24daedd7c815b6ee488b1e1f4cc172627579d3064e600f27"
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
