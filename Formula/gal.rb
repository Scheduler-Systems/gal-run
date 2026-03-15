class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.276"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.276/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0efe707218afd26b8cd7c52b6c5d2b175e28b577fc430de8e98fbb68068f9d58"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.276/gal-#{version}-darwin-x64.tar.gz"
      sha256 "17fca95ae0bf7f43f9dd29698b00b7051b2ec06506565089c3e5d0b5c19e8410"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.276/gal-#{version}-linux-x64.tar.gz"
      sha256 "b61317fa96ce2eed0226fe7d3de8d84ed127ad9ef4cde33c07282f079d180c08"
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
