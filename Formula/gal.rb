class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.502"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.502/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "560490468f188b4870957404f0d28ec2902653029bf2f8584ef987302acaa8bb"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.502/gal-#{version}-darwin-x64.tar.gz"
      sha256 "757d18cf07094908a548ba6f69123f557ccb7ce720801520e20f0a1d1d4b5ed8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.502/gal-#{version}-linux-x64.tar.gz"
      sha256 "f42cd1d93175dcf8cf2550e6c96079b61e762366603866c7eef3adccac40f98a"
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
