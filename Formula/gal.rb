class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.588"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.588/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4999efe3e950f62d843857c11f685214ed3404b71fc482fd4232f405440fcf79"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.588/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7c08b383c7385cd3749e4f1d23070a0901ea70cf672af4438aeb034016e78a6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.588/gal-#{version}-linux-x64.tar.gz"
      sha256 "3f4e672a9cb4591e484f009be21402f85d4359a2c0cfa1ce5a20abb894b34797"
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
