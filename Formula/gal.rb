class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.438"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.438/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "59f16d7bfd88e9b6dc13ce9588cbb63c567ec9b9d91bfd2fc40d9d00ed3e0538"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.438/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ebe93107ff8030f57b2f8a0b31f3e514296ad170632fe3a8e69f8e2376b6a1ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.438/gal-#{version}-linux-x64.tar.gz"
      sha256 "3452319d5dd396ea68c33f3b25a17a7db90333d20101b9b92b74f1b5245112c8"
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
