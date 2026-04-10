class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.566"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.566/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b94de50227a25b5c8c1494d0390f5663b710f02e6b3dd50d458d608a0cdaf4d5"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.566/gal-#{version}-darwin-x64.tar.gz"
      sha256 "e94bb16587b9a412916e978b3571d6982a172ebb8c488f364e6eafac2d94c098"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.566/gal-#{version}-linux-x64.tar.gz"
      sha256 "8c0c67a9e9224dbcf938152fd3aa0b7e35e5a05481473524c29e6678dc8247aa"
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
