class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.471"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.471/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "92d641f96d6ae5f60dfa986d2045cf02b02f69db0b9fd6c0878883f5a671e8a8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.471/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ad0a4f99985e69ebabaca7a58b4a97c449ce90e10464c1fe5be7d95db1b5c93d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.471/gal-#{version}-linux-x64.tar.gz"
      sha256 "3d1a570474b12e94866a1cc257b2ce4098cfb75a8800bae37a199dd62bf35fe0"
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
