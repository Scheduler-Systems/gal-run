class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.451"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.451/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b6dd52a881697bfb9c2385be6cd71a52e37e433f00f1693061426d620191e2a3"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.451/gal-#{version}-darwin-x64.tar.gz"
      sha256 "990c4fa9c18309cfadf7166fe36c0c426440864e7cfe261b98ca29f1bf947e55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.451/gal-#{version}-linux-x64.tar.gz"
      sha256 "6118a30f842d28a044702cb92cd08a783088ff20357d636fed7bd26d6ac7c260"
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
