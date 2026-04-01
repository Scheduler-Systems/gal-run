class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.510"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.510/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "28f7aac5584b79532789e1e1aebc73bf22b3ca62200dddf34d2e03b9b61ebcec"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.510/gal-#{version}-darwin-x64.tar.gz"
      sha256 "01677a1c65149c662cce8d2fec74e64cb63f1cb27e4c69f295524d586cb244cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.510/gal-#{version}-linux-x64.tar.gz"
      sha256 "36b6f415a6b95f7905369c674dddd05892a8cc4db135950922b5bb9653a8225c"
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
