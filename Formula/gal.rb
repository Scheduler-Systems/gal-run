class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.629"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.629/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "27bcdb9274c066b93c03a40fe9c051c80c3532d9d268f73badc4cc6b55ee5621"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.629/gal-#{version}-darwin-x64.tar.gz"
      sha256 "bb1dbd8cc4dde05b1f2488b8db32c3e816aac5153efed5e01ae347f42d5bb461"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.629/gal-#{version}-linux-x64.tar.gz"
      sha256 "a7bce7a1c6a7f2f93ba2259f4417462d320befc1b4c13919a4c097d6e0792ede"
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
