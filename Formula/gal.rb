class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.538"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.538/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "2c0eeb9a3894ab9a601ba1b11d68ea7090a46bfaf80812d10685f7ab2366e0a5"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.538/gal-#{version}-darwin-x64.tar.gz"
      sha256 "53c843f062e1c208d8278beef4f34b9c1091e5b5c955c3cb007401b089ee8f92"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.538/gal-#{version}-linux-x64.tar.gz"
      sha256 "1036a0e253ec385b63a00417c9e8e25758b4d252075e0044db0aec38824646fb"
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
