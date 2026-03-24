class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.322"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.322/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e9c723f6f3693927c8051e8e31159b606b3534044bfa1307f11622950fd85700"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.322/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0167638e0ef317265a93298ed4cad52e3e060339cdee5c084f2a06562ec1ba50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.322/gal-#{version}-linux-x64.tar.gz"
      sha256 "bafd1caf6010c35b41e5592b54bdf37dd19269c531c4dfdeea5a7501519700e9"
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
