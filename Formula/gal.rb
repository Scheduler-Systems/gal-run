class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.624"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.624/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "991e3d42cda3c0c18468434491b3dc72e8bb3a33624a4e2adb11c8bccc87d329"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.624/gal-#{version}-darwin-x64.tar.gz"
      sha256 "89e9fefafb0ed5f62344d9eba35563709fda2b648572d8b6d9ba16b4a51cb202"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.624/gal-#{version}-linux-x64.tar.gz"
      sha256 "9b38be58dbdf6dfdb03a2770188610c9e57459530e97afbb34e6a45b605421bd"
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
