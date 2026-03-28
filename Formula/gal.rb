class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.390"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.390/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "cf0254e661657af96133ffd597a4e56c927e3333bbdaca651e1e89c9af81b798"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.390/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c18ee9f91ccb1e922123713648f9c3481e2551715ab2f4cfe083de5df22bd941"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.390/gal-#{version}-linux-x64.tar.gz"
      sha256 "9961fcbbe16c4e44237adc1d35671bae1b212598b2098730ca623079cb7dd8c6"
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
