class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.507"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.507/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "827cde082520bc1fc62d30c36eb830984e7df12a71d8743540eb9fb1a2b9e26b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.507/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3cef5a428b51f385ba92995040d02f3dadd8a2613bbb9c775dcba40639dbb3e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.507/gal-#{version}-linux-x64.tar.gz"
      sha256 "b25f7969296529a8c0a7ed44ce107ab99d617f2a1cd30756aaf993ee56b1c14c"
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
