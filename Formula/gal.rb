class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.490"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.490/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c134d6b986d584af70ec5ff17e1183f8b481aeab91203bb18a3c8bb27fb9724d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.490/gal-#{version}-darwin-x64.tar.gz"
      sha256 "75ab85552de8f75f06efe14f82ee68f31e208683ebfe9c23cf12eb45908a118c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.490/gal-#{version}-linux-x64.tar.gz"
      sha256 "49079516fad15a621ba2ee071a8b2e5b1e6de379f147dfefcb7ce6bf7cbbbb7e"
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
