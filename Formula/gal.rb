class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.525"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.525/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "38f468a3000a05f2c5588032ee6f81925ab929f4ad4b78d6d2b4414011ec290c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.525/gal-#{version}-darwin-x64.tar.gz"
      sha256 "370bd45e78e56e8edd8a79648e189852580e3c79cc04c5dfc44f95d081c364d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.525/gal-#{version}-linux-x64.tar.gz"
      sha256 "a0321b7c36c3f75e566ae1bd21125a54197203a03e18fcee981d3e8416eb85d2"
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
