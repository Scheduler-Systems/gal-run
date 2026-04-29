class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.661"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.661/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "50b677b97daebddef2eb0a1cd4567764837a0f187012c010669850b15bf73887"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.661/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8c7f7f7e8950106e857e206c5b05b7aaf6146e89b37b8638f666ea31d8ca879e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.661/gal-#{version}-linux-x64.tar.gz"
      sha256 "72bcf12283645d66e8e9ad0b6d2377fb8526e0738a0d96d48518d1c5e321da74"
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
