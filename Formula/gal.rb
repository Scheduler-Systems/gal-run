class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.467"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.467/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "03590ea694311effe54c00aa32bc1e2834b4557aeb130668ceb82fd4a60de82c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.467/gal-#{version}-darwin-x64.tar.gz"
      sha256 "393994d1d7bdd7b0327816bec5514111464d78f1bf7649b7b557b52d6a63e74f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.467/gal-#{version}-linux-x64.tar.gz"
      sha256 "3546b4e0159ffc9f7767fe4123dd5068af303b4a75a1f275d3b97599b2730056"
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
