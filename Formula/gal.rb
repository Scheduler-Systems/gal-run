class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.554"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.554/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "26f72f9660a2d3a458769c13ccb08fd9141faa85459293edc99f90428976a9c1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.554/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0e819c0229762c46e6537c115ecf34a1671f2a11c506dc8a9e9c4c0607174911"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.554/gal-#{version}-linux-x64.tar.gz"
      sha256 "176abb581b9d530223150a54178b7e6cc5c5a70d9e33caedb05e0bda5b1c7527"
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
