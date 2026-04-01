class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.494"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.494/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "7ef64598729d5ef22b76ffbdd17108dff0771169ccbd2e453b63c2e338b313ff"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.494/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f6221b1e2aa3b26e40f352220ccf772e4d81ea0fa746936d91fd9562863421fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.494/gal-#{version}-linux-x64.tar.gz"
      sha256 "b11472066a02a213212ab8d6bbdd9d901a7766922cb932a7c8585d01463e1063"
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
