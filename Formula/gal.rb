class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.381"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.381/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "f70c64d2fc70b6728f4d36d2185b2ebfd66f92f9fe5dc3cc427d31ba04b4015e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.381/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8bb72bebdc2337a505c269723772bd221d4d90c8ec8adf9c552f1c36af857c77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.381/gal-#{version}-linux-x64.tar.gz"
      sha256 "3281c7eeff0fac4d292332c62ade63540676fbbba5dc699f793d03789d5ceb93"
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
