class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.1.62"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.1.62/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "288a1942fa2cd5af2549091a6e1d832dcd25c0473d6caf0dab4a80fae77e85ae"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.1.62/gal-#{version}-darwin-x64.tar.gz"
      sha256 "384fdc4c78df6ef8cb38966e297dba787b57ba599fbc4c3a17599224616694a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.1.62/gal-#{version}-linux-x64.tar.gz"
      sha256 "f0d7d666467a609a1829a08c4544ab80c052c146c7778a1556d98f42391dc87e"
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
