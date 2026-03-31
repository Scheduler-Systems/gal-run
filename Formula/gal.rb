class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.462"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.462/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "19946c25971651481600ad5f970a3339b4d8a2fa3b653edb04666f0a155b17a7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.462/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7be10231c1ad75e72b36d9c734452c7308d0ebd94eef8b59fbbe2c7d0513383c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.462/gal-#{version}-linux-x64.tar.gz"
      sha256 "1dd35e05fb30968c13ee6fd6576e9b23c013be25d76c3df39008e0be2cab9f8a"
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
