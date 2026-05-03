class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.668"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.668/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ff36d03a61ed20b12b2c602cab6fdf353215f1d571ae90d0dbd65d30f5d9b7ec"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.668/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b1f29207fae0842d44d0a4a2d562b7bcfff8bedfecda278366639371f253652f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.668/gal-#{version}-linux-x64.tar.gz"
      sha256 "44b01dd37ff509cff94e96dddfbd4e6ad542a90c3e6228985fb1d2fa8f86c3c4"
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
