class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.385"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.385/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "673ef18b1042c471316eefc3726913b193e2ddabcf78d5cde04e20a879f705fc"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.385/gal-#{version}-darwin-x64.tar.gz"
      sha256 "b424faec74c296d9ea59b3eefb166178cb47d201e71bb7d9cc875ff9a25b5a5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.385/gal-#{version}-linux-x64.tar.gz"
      sha256 "a944bcb7e2616663f7281c975747fd438a1ee9fa2cb3b2db21b9666f24a72d39"
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
