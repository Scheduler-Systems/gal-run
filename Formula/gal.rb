class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.279"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.279/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "64e6b515abaa5f7a1b968b7abf73914c5b5e85e619bd4f9e6448e1c6fe893cd8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.279/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8d34282ef4805c9e25a29909170a7bc7495617f41ed846aa4f2f995391a00ba1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.279/gal-#{version}-linux-x64.tar.gz"
      sha256 "c258c69d4ac40b19dc2d20da5c1baef88b9608a45aa484aac0aff631e440852d"
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
