class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.374"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.374/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d030e8e5355d90a74223804d97a6a6f9231ff2347ec72b69b1635191772d1d8a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.374/gal-#{version}-darwin-x64.tar.gz"
      sha256 "94ef4a9187765ccddf5714f0f2c0b884d293578b44fd60bb569e2ad3efbc731d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.374/gal-#{version}-linux-x64.tar.gz"
      sha256 "25f631df30e85787178bba7fe6c1dbfde460c07702b60fa54e9dbfa4ba99eb94"
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
