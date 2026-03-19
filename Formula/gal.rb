class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.306"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.306/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "3ffb8599fe9d3351f6b328830efa7776010edd548d6641be1d21347edee115fd"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.306/gal-#{version}-darwin-x64.tar.gz"
      sha256 "412e573c6e220048e40135586f2ee41435b5b3f1b5787f9b3888b3a072804786"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.306/gal-#{version}-linux-x64.tar.gz"
      sha256 "efee87bad5d18b83ab94de3baf374421573679fbb95e3592689b98fb5dcf8c21"
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
