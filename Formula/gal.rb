class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.534"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.534/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "96eae70ae1a66464db556c624a73d6bf81efcc1e05c00c71eef08566b050da98"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.534/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4a3b0f9e54d7de25c91a5f079fa737b9e82602a61c18b1e61eca6a0006f09944"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.534/gal-#{version}-linux-x64.tar.gz"
      sha256 "992be5321d71163d98f32c11abacaaed4b2e986ac382d44bbea1a7ab60a7ae77"
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
