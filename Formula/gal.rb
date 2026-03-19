class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.313"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.313/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6218108ffddbcfdd651f16e119c62a9d59c3bcb862a75605988636b9e69bdb1c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.313/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0d2eae0cf1b4f8775931307a9d3b2d6eb7e6d731d68e4fe8b896501e16318b0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.313/gal-#{version}-linux-x64.tar.gz"
      sha256 "2fb51a7264628d62b9e2018c79456c6b62c3acf007a7a9bdc9b3b373e975c291"
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
