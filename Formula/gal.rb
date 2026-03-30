class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.432"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.432/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "363258289717c814eeee1dee5ad40e40dffc843a39c555e96b32966fa3c542ab"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.432/gal-#{version}-darwin-x64.tar.gz"
      sha256 "74be5e73740beb622663052b25dcc3ca019b880952a5cac6748c0e53fd415aee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.432/gal-#{version}-linux-x64.tar.gz"
      sha256 "6690b97849fcd6a63291196746932f8d7d85710b6867e29d97561adda0bb89ff"
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
