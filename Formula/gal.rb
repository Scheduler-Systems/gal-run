class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.450"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.450/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "77ad17307cffecaa8ca7cf55e252051e24a6caa8b31281631cca69a3618ff1c0"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.450/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7ad0c4b97cf630b8345e4500daf257a504add5f40e17aeb439b03eb5cff0461a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.450/gal-#{version}-linux-x64.tar.gz"
      sha256 "700cadb64a011ee25d239fc6a48be24ce1a6962276fa42b361d4874ce8e8b4e0"
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
