class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.463"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.463/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a377cd11fd5dede132bbfb1887a3b82adf379114f196d469cbf5b3f09712e82f"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.463/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c7c2f12cf48ce5b6a9aaae0bcbeb73613557461a7e5ab4fe2c8c4e8972d2c5ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.463/gal-#{version}-linux-x64.tar.gz"
      sha256 "fd3687a9016272f0233e29201f18b26e364e5fc572270512a1fb5574bb7c1b86"
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
