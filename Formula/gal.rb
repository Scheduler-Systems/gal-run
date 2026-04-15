class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.594"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.594/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "37af70b82f6e4ad61b07b66327e5092974a3c9f183051c27d0aea63b59637229"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.594/gal-#{version}-darwin-x64.tar.gz"
      sha256 "94b7b5d643c12361ab2909368e50f2c6cb26270ab7a4f861dd0232be81c9051d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.594/gal-#{version}-linux-x64.tar.gz"
      sha256 "87c1122c3f569c3aa94eb591f72e975d65e5945633307bb514d0e4d96200d19e"
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
