class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.499"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.499/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "db77ba19bf776ec00292ed2b35bca01daaeac1e3d54f9a251eb5873ac7da0f0b"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.499/gal-#{version}-darwin-x64.tar.gz"
      sha256 "adff8b46084a2ce1e165ab2764ef6aee90d2ebd57523fe48d573ac4359e37ef6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.499/gal-#{version}-linux-x64.tar.gz"
      sha256 "3e9b33b936061b6fbda81dd4e236f48293590a97b19953a1420ca16c4e31a2be"
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
