class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.674"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.674/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "3d68f5cebd8c6d7f5921b86f14d44f1a4a304c1a4bb6ec43efa7dd19ac2e216a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.674/gal-#{version}-darwin-x64.tar.gz"
      sha256 "494f8d7aff3fdc208a209f1de6692b3849065e849c75ab5a5a794a4800041867"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.674/gal-#{version}-linux-x64.tar.gz"
      sha256 "047416203695125a4b4472989ff7ddf24bb7e4eed7d0849d5edc5efdd2218c0f"
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
