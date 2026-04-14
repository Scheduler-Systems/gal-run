class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.590"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.590/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "978cadcf9ec465c2f0894a05f5bfe21f65a74681fddc554aa4c27a5a6cdaa698"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.590/gal-#{version}-darwin-x64.tar.gz"
      sha256 "074da4ac412d8f8f2dae1f7cdaa6f5fc28f7915abb3182664158c8d853117b7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.590/gal-#{version}-linux-x64.tar.gz"
      sha256 "156d2bb22a11653b2a343f6bc03ea89357e1efc8841febf7dfcd0be4ad315e8b"
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
