class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.602"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.602/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "531655de5f750d68350e3a3c8e2fb9e124c0e69d93620ec9bc2ef3c607a9a6e7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.602/gal-#{version}-darwin-x64.tar.gz"
      sha256 "58ca3aaabb7ee46690095c322eaf26de3618d96386bf87111c20d8c967b6942b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.602/gal-#{version}-linux-x64.tar.gz"
      sha256 "d828bc292e6c40a4948f64727d41eaff50078c393379bbb5be48ce10deb00baf"
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
