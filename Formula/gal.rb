class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.517"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.517/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ffc4e3a6a8137cc87021d88a4f850bb21bda040732d767708a2e5219f2161742"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.517/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f0947dc8f78ebf8a9276e51474998c1be912fc5eff20c6439cd9f19bcd62292c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.517/gal-#{version}-linux-x64.tar.gz"
      sha256 "4a78e57bd57d195bf76001aa9cc64c633a5fbb99358bfc44829f1c7845212427"
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
