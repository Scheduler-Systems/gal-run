class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.621"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.621/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c69e6cf14abf0fadfa196c5e5ebdde54d851e138c2e4537164365df6cd952f19"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.621/gal-#{version}-darwin-x64.tar.gz"
      sha256 "650e49511db4785daaa352c496beed892f9a3103d721f1c969350a77db95c21f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.621/gal-#{version}-linux-x64.tar.gz"
      sha256 "2aa10ca3f9a76eb46bd1ef2fd06f73e883eed12be09d7cf6117a80633ad191c3"
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
