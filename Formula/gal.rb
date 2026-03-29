class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.406"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.406/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b7ff831ff3c6a509f704dc510053c01e8370fbd8f46ebbee724a43979a068ab4"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.406/gal-#{version}-darwin-x64.tar.gz"
      sha256 "a830716cd1081d618d6f1bed066157d7bf0e29532dfe443e97c0fc7ed0059e8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.406/gal-#{version}-linux-x64.tar.gz"
      sha256 "d5813eb9c96264df7adf0d999cffdca4f7bb605ee7a3e1f913d487d21a82be26"
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
