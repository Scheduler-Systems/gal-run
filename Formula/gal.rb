class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.565"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.565/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c8de10283288b38a72308b331d813a791f059568f2141fbc56f44352fb8d24d0"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.565/gal-#{version}-darwin-x64.tar.gz"
      sha256 "61e4442cb8d79dfa51dbc1f819422ed22b9da7bb58b0bd52c3ea24f70751e719"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.565/gal-#{version}-linux-x64.tar.gz"
      sha256 "ddcb02e48b163da1f6ae7ee2ecfbb23d514f825fbdc6c556b3a79ec8823a87d9"
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
