class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.576"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.576/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4a20e97ff7205ba736fb727505fb71cceed6567003f4159750d9ee478d2e2ad8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.576/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2c3e313715b5bcc3a0d5b0827a3fed9774f560f6a135852331c910ef3ba91900"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.576/gal-#{version}-linux-x64.tar.gz"
      sha256 "df452d05f20e3355eb4621cfdedd36d787149885933b277540b9f125e4ce0865"
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
