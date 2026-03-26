class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.364"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.364/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b6f036013315286b1d2b2e8e61919fd6077deeca25af64d057ac2084e5fc04da"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.364/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b72cda8c4f70f9943668ded39e39f148c155f7a0e621daa46f9230015dc60ad4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.364/gal-#{version}-linux-x64.tar.gz"
      sha256 "1d10cdb0eed821772a8f0cfd29154343b1e69cdaf42107a42c78a995be7445ed"
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
