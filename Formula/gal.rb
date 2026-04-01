class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.511"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.511/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "30b6b4af92bf874a2b0a9440340408fb1dc80ac7d0db8422f1f358981712cc28"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.511/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b6c52a30d2a7e09c36b0d601d419484f356d2a97d566af461534f639897170f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.511/gal-#{version}-linux-x64.tar.gz"
      sha256 "b423c24070b93f3e7ef36e7538b095eeb8ef7bae8b69f819c58eb97c60a429ab"
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
