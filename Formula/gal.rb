class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.466"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.466/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "83701163d387a0663bd53374aa3d2c3a98cfb9ebeb86a1bb33137d8a60689dbf"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.466/gal-#{version}-darwin-x64.tar.gz"
      sha256 "332f5f6eb0b5f2e3e3bab8687bcb617aab8390cff0312ea4b679e950536b2e43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.466/gal-#{version}-linux-x64.tar.gz"
      sha256 "e2b388dd1ed79d99d8fb3b2407e4cf7a78f21726f18e476cae421f1ea12ced63"
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
