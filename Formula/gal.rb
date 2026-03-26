class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.357"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.357/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0629efb279fc205dbc175f1611b01013131b628f0790f46e135aa9766837b28c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.357/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d6b13a82f11a49ff1525fc82554eb7c1fe62a47d295472d2d1031ebae612c70d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.357/gal-#{version}-linux-x64.tar.gz"
      sha256 "62fc07b150cd1b9090e61bd8dd6a7d304a4d87afb6f3d690715f2cb2d4ddb74b"
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
