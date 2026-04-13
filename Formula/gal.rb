class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.578"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.578/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "943169937095f8b16fe9f0804f2d48c149179b78bf6f6ba5bc6e8217140c7c7e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.578/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4cb9296d68080204ef7288688071fbc972183e69bcf3894d87af0818aeb3e5d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.578/gal-#{version}-linux-x64.tar.gz"
      sha256 "fee3001d2a75d50eb65bfdfb6ffe4eb95c76dbb03ab76ca605ebdcef4ad253fc"
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
