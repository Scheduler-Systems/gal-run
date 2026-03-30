class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.453"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.453/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0339814a4b2534bfa53c7ccf2a28d8f073353a686232b68432de5b3a5f5e2728"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.453/gal-#{version}-darwin-x64.tar.gz"
      sha256 "863c5267ee71013f99d9307583070e789eb61217cbcf85c7e16f60ab9dd4b1c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.453/gal-#{version}-linux-x64.tar.gz"
      sha256 "69a332d8ee8f473ebaf447141df8111c31d071f56649d4fddda6227af8d084a5"
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
