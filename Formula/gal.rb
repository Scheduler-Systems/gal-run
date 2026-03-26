class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.354"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.354/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a6954e48763de8c7ceeb4af22591d311970a490845634b65b6cfb632f0d90681"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.354/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c69fdbdbecadff17fbbf3731d307ba1ba1556808e29412dbcecdcc908f89fa5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.354/gal-#{version}-linux-x64.tar.gz"
      sha256 "a486bc1a8f6f419b4b54056b05b7e4983df3b07d240cc3dc3ed094dd7791fea7"
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
