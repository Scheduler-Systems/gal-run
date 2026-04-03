class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.542"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.542/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "7b7ffd6e57bc2e0cb0790f73f0f99dee73ac79338e4fdab13f6c7444a1b73e79"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.542/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3be499b230501e31afff9bfd034f12aa3eb0da772eee025c7e8549a71b010316"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.542/gal-#{version}-linux-x64.tar.gz"
      sha256 "a38649e39f2c9e89e578c668a5e7e7f6f263598ffd1f202f9d9ee535d950149f"
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
