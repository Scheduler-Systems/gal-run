class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.504"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.504/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ff08bf46aa38322a2e1d85cbd86b9471fce84d22dce60c6d55e7e1b8052d1eff"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.504/gal-#{version}-darwin-x64.tar.gz"
      sha256 "350fe7ce733b3ed61522121e20b8dc26e53fabddb988db9216fa002f0beb8120"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.504/gal-#{version}-linux-x64.tar.gz"
      sha256 "692d6772d4c1bd59f9572def5a4b4fb308f06cc43fd22df85d8aabb91b81ef82"
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
