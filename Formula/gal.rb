class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.479"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.479/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2518bc2bf18bcb037eb41ee94a9e43eaec7fb44dbb6439026f9926d940219f28"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.479/gal-#{version}-darwin-x64.tar.gz"
      sha256 "53d5d518b216b2d605f5f0afc1d096eb06a682943457f33eb72798897ee0f7ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.479/gal-#{version}-linux-x64.tar.gz"
      sha256 "8925744c86fa1221812d137ec84317af93dcf5aa6ca6d71e1d173695ea6c05d2"
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
