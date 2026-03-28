class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.396"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.396/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "17f97b0f15559aaeabbe5f93741b42af10df6f5c6dc8b5bb32cc32862a6f74a7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.396/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3081ba5fe806bb3e703120043d7fe4e94f2b103fa8a04f25714592e1b5079d3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.396/gal-#{version}-linux-x64.tar.gz"
      sha256 "f5fb8630c57cf6ebe0c7b449983545d01c08b9dcbc27188d03acb8ebeabd0cfe"
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
