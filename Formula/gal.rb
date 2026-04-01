class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.506"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.506/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ad4464f3dba40e316d24a53a820c53e747bd7487fc0e35ace2b786c5a15c3cea"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.506/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b0066a8e5c1a8c9a551debde2863207d10b6bf3385d1ac411b643c4ee64e6575"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.506/gal-#{version}-linux-x64.tar.gz"
      sha256 "c05d555c9476f4acff7e0f156fb63e36702af008517549afe897e7cbe71d996c"
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
