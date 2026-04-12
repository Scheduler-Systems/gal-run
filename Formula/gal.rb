class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.573"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.573/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "dec8d4e2de77e718c1ed260d2eb3fb2a58f175acb63aaf71e5fbaed51ed7bc1e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.573/gal-#{version}-darwin-x64.tar.gz"
      sha256 "12c2c96422e31db1a864e63692e17da386141c01c6a094059ffa484c4d246c1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.573/gal-#{version}-linux-x64.tar.gz"
      sha256 "7e1d5f09ef48951aa1d3455b681bde48541ec77ca06095f7759f7a360a8876d7"
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
