class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.355"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.355/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1bfcdf809aaa5f1f1f8fa4be0a2ef0489361d60d233a81f56d8fe2cee4066f15"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.355/gal-#{version}-darwin-x64.tar.gz"
      sha256 "90f4fd57754a8e02b45f43850a3eb92abbd608dd7dc2f3b4c41a84de98e3f54c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.355/gal-#{version}-linux-x64.tar.gz"
      sha256 "9e9b87ff91e962b2977a89df5bde484d57641b3edea219967567482f3b8413a0"
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
