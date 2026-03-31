class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.455"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.455/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "698f3f7670b06b3270399e5ff38ff137f9ca69897ee7d61120536555bd9ab482"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.455/gal-#{version}-darwin-x64.tar.gz"
      sha256 "65a6fb39e02618801af2158edd876e15831770db4d8aff10d4a280d64d7a03a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.455/gal-#{version}-linux-x64.tar.gz"
      sha256 "798831d0ee37befa046f5f883b34846ec6ee0936ae068c4eea716f168bb6107f"
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
