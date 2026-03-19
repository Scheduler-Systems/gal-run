class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.305"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.305/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "601a8026c07369865a4424cb7afa46e658b8ab5c7f1b1b1fa774a6994042a281"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.305/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7435445ff6a2cfc9d8a6b4c6d14c9afa7b3dcd5f0a5ba1b76408725a5da4fe9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.305/gal-#{version}-linux-x64.tar.gz"
      sha256 "744074650ec36f5f1fa5f1605b19f85c7dfd7edb4977414b518a000ee3aebeb0"
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
