class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.360"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.360/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "19a9cd038b768d779c5ed725a5d9cfcdebec8ae1c3d21d68919e7326791617cc"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.360/gal-#{version}-darwin-x64.tar.gz"
      sha256 "bd3f7ddcf4bcc3f6db13cb96551708666e3a4f832b4510a5dc04a0ba340fb00d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.360/gal-#{version}-linux-x64.tar.gz"
      sha256 "596fe3c89fe14f93ef1288bba86df5514716be817f0a94c0fa1106a70ea41594"
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
