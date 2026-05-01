class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.666"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.666/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2d6c035364b22217f862234462f71fd0ac385f0a74a1937844b82358ab7460d3"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.666/gal-#{version}-darwin-x64.tar.gz"
      sha256 "9e8d335cc8e6cb9f76773dcb02597295f000ff54e848c0229c2f6a5e36a1eb50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.666/gal-#{version}-linux-x64.tar.gz"
      sha256 "bd92e6d2e6cd6acac3ae5073e264aeccd384b64cb0d78f0f1e3d44cca04e2999"
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
