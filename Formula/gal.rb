class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.475"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.475/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8287819f7966973791b1bfee20b66be6cc2da813cd9aedfa395a4588486eb765"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.475/gal-#{version}-darwin-x64.tar.gz"
      sha256 "048cd47f7b0d0e5cf2305a6bd8b7ad03dc57a15aaeceb55adc4340ad07605eea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.475/gal-#{version}-linux-x64.tar.gz"
      sha256 "36319c9465ddc6c43ef70e82cdbb2fc00887f3cb430627df0a283bb182ad53f1"
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
