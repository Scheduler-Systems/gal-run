class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.420"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.420/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b52965496ce5c877692736c797944471c18c96af351e96e904350ebf047d8b66"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.420/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3fdc95b3fcdaec2076f0b54052620b5ad1951df066647d0c873e1ca8e95c499e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.420/gal-#{version}-linux-x64.tar.gz"
      sha256 "b3464b1f03c821c91b083e88ce8a2f34e32148de559dd15eaf4fa8757559a92c"
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
