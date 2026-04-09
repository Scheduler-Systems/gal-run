class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.558"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.558/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0549d32aa23d4a4dc78dfb52c4d54dc6fff51335230219a86a08a47866e7df71"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.558/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6a27fa69a5aaa562f41973b2df79c792e1fe7938d7297d28938e2dd6cd8143bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.558/gal-#{version}-linux-x64.tar.gz"
      sha256 "f59d2e7addd9a3cbc0e128a53e6f777c1be38dc03ac38873d8145fd2f19f24ed"
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
