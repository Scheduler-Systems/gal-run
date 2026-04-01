class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.521"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.521/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e1115a1856dbbb43331e35eb5fcefb5fd7dcdd1c4240613465fe9720cd426cf9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.521/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3d3d9740d9a3af9b4370995cf01326ca4b73bc8a8c9a1f603b1b009cf956bb41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.521/gal-#{version}-linux-x64.tar.gz"
      sha256 "6eda3c76c8651a8b9e4219991435f24d7f5144012171f218b953bfe6621a32d6"
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
