class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.440"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.440/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "78404eb505ec42b22985c041a38f917cc8beadf5d44eaae970e5c80643c6e2c2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.440/gal-#{version}-darwin-x64.tar.gz"
      sha256 "87dfed6f2d9f8d1728da1c903a8d0b8d4f029846955f96873ab8b585e0fa62be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.440/gal-#{version}-linux-x64.tar.gz"
      sha256 "557b4146433c2dbdd8c855c0869c695e3c77fbd8f7f5b87af6998d51fe36cb86"
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
