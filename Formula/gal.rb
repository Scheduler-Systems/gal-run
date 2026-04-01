class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.492"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.492/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "265d4a9906a66326264453474c388d1860d66fcee103552388ae393618f9bdb7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.492/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0d9aeb4f929731f96f4d8d26470673dab420d43e4dc98a650011fbddcf682978"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.492/gal-#{version}-linux-x64.tar.gz"
      sha256 "657b244db0c90a3fc075a2d13e4d396e212334c352aca50c66efa0617ef7ae1d"
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
