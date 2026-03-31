class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.465"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.465/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8702721397afc449870ad2b70ede4986c35af5e467257014b3e14e2424c48387"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.465/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d67ed6c98de9a0c101e3c80e9aaf640871f084b85d1a857ea18d5ca2bb09d9a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.465/gal-#{version}-linux-x64.tar.gz"
      sha256 "06a8a1f65fdae364b04550077d0f9ce7400d7967428c7332e3ce7e0584a20834"
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
