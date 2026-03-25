class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.344"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.344/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4f086135acf561825bd796d8d4f74431df5314173a5ead75f66dd1185bf32da6"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.344/gal-#{version}-darwin-x64.tar.gz"
      sha256 "71d9cd2f96f865c6ec47f23f29ab07ef17165b72b467a15cb295a62518caeca7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.344/gal-#{version}-linux-x64.tar.gz"
      sha256 "79d1393ecf10a4fc38de494be77e684e6c270b3dc48fe7b532c3cfd2bfe6147c"
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
