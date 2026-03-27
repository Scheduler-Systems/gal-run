class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.377"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.377/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ef392794944fd54aabd02153e8cf6aabc3b61c677b5e3a19805f538cf87914a8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.377/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b67c3d5fcf4095d65e5862a68a43fed997f6a4cae5579acd63c2f104e3e86455"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.377/gal-#{version}-linux-x64.tar.gz"
      sha256 "384688c3b621a869fa867ecb5a961029dfbb540c468457897ba803a834155a79"
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
