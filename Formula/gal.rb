class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.493"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.493/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "89421e95c7dd32f07e5f47c5242bfe5c6078c16070d2d611e4ab887dd2bf0c5c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.493/gal-#{version}-darwin-x64.tar.gz"
      sha256 "473a983e42a32c5254efdeb523888b0ef56f6375e7ed6b795ab8f22033c9ef76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.493/gal-#{version}-linux-x64.tar.gz"
      sha256 "4368ad2dd94db5049f06d063c1a1f146855a7f27a7a41bafffc65e87a815ae7c"
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
