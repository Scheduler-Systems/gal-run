class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.505"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.505/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d800c65b67007be9202a59790b51b6513bf351c1d6fe6f59ec7729f90af31e42"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.505/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c35f1052cb6d9bb17c5f50cb30ab499b23c44ac13fd8977b3abf73b26601528a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.505/gal-#{version}-linux-x64.tar.gz"
      sha256 "880fe1c2b2820316be95578dee81444dc3e20a48034a02a8d4b3b5d69839c901"
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
