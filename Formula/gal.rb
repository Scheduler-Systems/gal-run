class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.324"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.324/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1bc807b95e1a71a085691c67e2b93d56cc3554f23694dc7411d14b2d12d3cfea"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.324/gal-#{version}-darwin-x64.tar.gz"
      sha256 "33bcb07f493cb12f47d3c972f42aafbf6a47b9f9bb648fbc9f223b12181d5ff7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.324/gal-#{version}-linux-x64.tar.gz"
      sha256 "2e85571e548d0219e8a2381f06b6505811f94bab7a752113756cf6c4b9d3036a"
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
