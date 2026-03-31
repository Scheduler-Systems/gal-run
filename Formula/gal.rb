class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.461"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.461/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4f558b0a22df41b53ab7830634dc9855140d52c7e198270d18a43e39f267f3ba"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.461/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8e87338f91c531c936a0aa795f94457ded4943ef5ff5582de6b49f71f7152033"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.461/gal-#{version}-linux-x64.tar.gz"
      sha256 "9a48a1606ae50d0da97fed1cc2bc5dcd7c304b61f431fddb2d36f19ea54c9110"
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
