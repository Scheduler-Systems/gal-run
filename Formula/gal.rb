class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.370"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.370/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "7e67b0a83893203bb36902a1449caf93259d5f9a733b64b0f0b24a01a30179ce"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.370/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8d736d27f9db7c0a999f2c93517dee67dce3d7c3e3ec9a64af713fcc1cb79b39"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.370/gal-#{version}-linux-x64.tar.gz"
      sha256 "6a0f80223e9e09a1177274144fb7b3e9051efb2e0a75411fb4f837525a9324b9"
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
