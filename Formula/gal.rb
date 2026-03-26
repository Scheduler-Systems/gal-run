class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.346"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.346/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4d9af204ca3aae29bc119fd1b9f6371d533caa33b61c0477104ba7f2e369d6e3"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.346/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b71f93909789dcebbfe13347f9b97c9c9d6cc6bb29d55a728f00b5bfd063ccb6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.346/gal-#{version}-linux-x64.tar.gz"
      sha256 "ab8210844c623b120d6e12abbe5952efcc90a04588014fd1ac29dd292dedb5b3"
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
