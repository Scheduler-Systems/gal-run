class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.452"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.452/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "f1ca0631261f0a65cbcad0e3c7733924fcc868b3f014e576ba3d8c3b757413d9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.452/gal-#{version}-darwin-x64.tar.gz"
      sha256 "546a9c80f7aeccd32ebd44602d80aba025271c8bd34f1985df7aea06f0a1624c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.452/gal-#{version}-linux-x64.tar.gz"
      sha256 "8859ee6124d20080204cb55b8b46efc9cb999bf83bba7dfd0422ffeb81b1c5e7"
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
