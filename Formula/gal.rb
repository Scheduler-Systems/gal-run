class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.564"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.564/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "98202c0d3a57fbea6e697df9caeab091805547988381e78a729545a6bea4bc29"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.564/gal-#{version}-darwin-x64.tar.gz"
      sha256 "993654769e8697acef45320e3ed5159ab8b13d5886c0564c2318837a35f695d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.564/gal-#{version}-linux-x64.tar.gz"
      sha256 "cb8c6577788f12530d0952f5d879a5569634dc919e29ad92bc5560d828311ff5"
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
