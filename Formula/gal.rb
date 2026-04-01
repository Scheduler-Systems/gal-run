class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.496"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.496/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c8e104b4a1a8db82d55f77b28a416010c2cc4ed3d7e436ff2599d988bfbb429a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.496/gal-#{version}-darwin-x64.tar.gz"
      sha256 "061c82515c73018d9c2a1144e6c930df9146a4b89f66ab44ebd5cc676906ca46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.496/gal-#{version}-linux-x64.tar.gz"
      sha256 "9f3aa5093cd5dedb61fbc7861813d734f0d6cf841d0b8350cb8d907575340405"
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
