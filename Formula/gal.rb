class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.560"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.560/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "9e0237936820a16491df40eb93d826e1098c5c93a69e7747bbb1a59f48b8f1a4"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.560/gal-#{version}-darwin-x64.tar.gz"
      sha256 "01e262ee38ef31d39c93b0091d372c8d09f7c92b175941a02eb44128cacb6062"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.560/gal-#{version}-linux-x64.tar.gz"
      sha256 "91a4a676a7ffc1fef4af638d5af9dbf4f516f780450dcc1898f40124f72259a9"
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
