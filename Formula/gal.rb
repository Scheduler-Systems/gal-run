class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.464"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.464/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b2eff2f495142c192510e243cefb063805fbafd660465a1882cae427dbf2eb30"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.464/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b995cfe5de5541dfd7a6627e4914d67d81c7305bd402e5d3ca6e30cd901785f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.464/gal-#{version}-linux-x64.tar.gz"
      sha256 "6b5f0d6b69f1e36d51ea28ac715e63f66b64b19a3ab5c9f056f6840b0d3abd14"
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
