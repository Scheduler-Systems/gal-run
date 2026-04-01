class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.500"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.500/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1cae07112b898009581cd4a419c947a212c9a911f20ba8b222fdb222fc0c66fd"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.500/gal-#{version}-darwin-x64.tar.gz"
      sha256 "875ab5b2e6ba7f252814c0965a5e343e7f24f8b4f1282d1fcc78993a5e11a1c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.500/gal-#{version}-linux-x64.tar.gz"
      sha256 "2da0425e72fca463d2701136155e3ae990d74552e8778aa82263ee2fb7666764"
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
