class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.422"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.422/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8e0f2e771483a0c62f4550d305f12dff737a1e8f08a79c2a808df62e7800b563"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.422/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2193c67663f59f87534144b8d1be64e3584a678b8966cd9f3f7136d47231b599"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.422/gal-#{version}-linux-x64.tar.gz"
      sha256 "fcbdb8a72d25e28ae7820ca89696785642e0fb98bf080ee48725f73c6aef335f"
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
