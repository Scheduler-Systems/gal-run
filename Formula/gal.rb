class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.626"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.626/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d857e55256054269277befb0af59ef2e6851e07ed82798c77a83d4758634bb91"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.626/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6f90b5637712b8accb25e6a7a2e09ae6817cfd5a371d9aa07397b9d41a82f4ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.626/gal-#{version}-linux-x64.tar.gz"
      sha256 "3062ea5d44de380fc0047514764751933d3fae7f305941b445210b6622c559b7"
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
