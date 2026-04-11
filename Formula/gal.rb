class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.568"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.568/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "50804ba418a1cc8286541071a58b9fd8b3d81550b20f6f9969341fc1270eea6b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.568/gal-#{version}-darwin-x64.tar.gz"
      sha256 "504e3f4fb3378911a7dfff40bac75eeb4ef4731d71f80549dd0b3c8e490b6afb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.568/gal-#{version}-linux-x64.tar.gz"
      sha256 "816d6fc56e2ea85500ccfe415038e68c16a208c11d7a67d20590e1d38846fd4b"
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
