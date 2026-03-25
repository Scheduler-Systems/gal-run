class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.329"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.329/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0a72b11a4937aa9833d1446a95aad56e0d57f8f2cdcd7f1530b8250c5a55f515"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.329/gal-#{version}-darwin-x64.tar.gz"
      sha256 "38cdf99fcf977a2526f72ff35ac1fe55cc0ea99b7e135244274a0f92cde09ce5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.329/gal-#{version}-linux-x64.tar.gz"
      sha256 "04440e9b356168e022c9c3ce356fd46bfc024057da66b2807b4f7348b6324c97"
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
