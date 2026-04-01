class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.524"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.524/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "64dd1a5d7e294dc9f23667cda2890662b0fc3111c31b935bba77fc48a5ce4d0d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.524/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4c8254d0252e547c0dc6c6db9d54362d65aeb184110c5ca540d3634c181aa992"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.524/gal-#{version}-linux-x64.tar.gz"
      sha256 "8e64c41a9eaa95a2f26012529bd440b63b090dfb7474c901c97a8826a85a8f23"
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
