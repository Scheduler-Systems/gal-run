class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.434"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.434/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "af93abe1044a380a9e59c270141f3d91debdfe3a142ac159971cc2d0be68d7b6"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.434/gal-#{version}-darwin-x64.tar.gz"
      sha256 "5329f965799abbdfb6049ffe667069b7ecfc616bc93c06ff6c55c93edf916358"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.434/gal-#{version}-linux-x64.tar.gz"
      sha256 "cb073af4b27213db6354c8d03cd5932229318cd95e1af3874f720fb81aa0e125"
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
