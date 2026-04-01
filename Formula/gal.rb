class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.509"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.509/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "25c18692e1d2cb54e422d527a8b699e8903ef7fe8f0d0fedf96e788e2ea084b2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.509/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b721db994f6f5e53310aab2503a7d95919cadc5b09e63f070e53c166b41f2204"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.509/gal-#{version}-linux-x64.tar.gz"
      sha256 "08633061901ce4478dfb5c1e1239181ccc08391fa5126f6add4248e2f85b928d"
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
