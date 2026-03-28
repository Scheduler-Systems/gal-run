class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.394"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.394/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "cd356fb64e81331c2dd4d6f3346d969acf4ccabd55386e2f7a17fcf8535704d1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.394/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8bfa667c5c993e1068f77007a47f35b871a0c2411a9fccd889549b76e00b7a0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.394/gal-#{version}-linux-x64.tar.gz"
      sha256 "c896bfa73aca50b2711c1b4fad0b4383b40776add39ad34eda1f5a5f04b322b8"
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
