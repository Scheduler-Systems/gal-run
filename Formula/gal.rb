class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.427"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.427/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e85401564ed28708a862c866f993696e50ea866812c3442bc629898a83f85a26"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.427/gal-#{version}-darwin-x64.tar.gz"
      sha256 "dde5cbd2f96d7c56baf5ddaf070d14056e993f462fbc1472f1d5cfc43c9735c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.427/gal-#{version}-linux-x64.tar.gz"
      sha256 "410b99c779e462f4c6700dbb9caac8655aa0b53f5b39e769e7bf1d5854d74ffc"
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
