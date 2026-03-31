class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.459"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.459/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "fdb0115f6bf39e80a31965cffcec0b0af066dd37812d5397968afa837eb92c0c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.459/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3f1c8f0e44b84628c1f53c7eb8b9e3dec2ca826c66040c4eabd8563d93b5877f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.459/gal-#{version}-linux-x64.tar.gz"
      sha256 "f3cd0699f6f53358dca7bffd64659fadedfad20feadb0915b335165a3ccd4c9f"
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
