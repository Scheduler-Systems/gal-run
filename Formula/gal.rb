class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.485"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.485/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1761d9aa21737f9e9188f83fd128ec210fe2b9cb43b485522ceb01ad26ee9fd7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.485/gal-#{version}-darwin-x64.tar.gz"
      sha256 "685e8351d376279c3036f467a05ffb5ad7cebed5691eb5a54c09e58ef11c8e88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.485/gal-#{version}-linux-x64.tar.gz"
      sha256 "3b9ed1178f82e8985b0fcd4a74a448ee5fa5f580b16e5a55096598d2781055aa"
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
