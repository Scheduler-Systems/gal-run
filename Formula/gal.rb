class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.384"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.384/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "fe8321a262b5ccd85f44f18096e9bbf2aabec7ad66ae2d3e5a86626a50ec0ff2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.384/gal-#{version}-darwin-x64.tar.gz"
      sha256 "e318699ee71084befb6a2499f6171c5314a224a90aae8aaeda8abb2fb09acc6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.384/gal-#{version}-linux-x64.tar.gz"
      sha256 "cc50f75f1175a08059b01ffeaa36bc0ae95b6c05602190b16c0d8a4e35d284d9"
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
