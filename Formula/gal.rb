class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.353"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.353/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "86cf056de205c8d196e72cda0411bf74e29eb77ab4b350bc67840bd0950dca55"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.353/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8e946f9e4fd6593d60bd7eec5fbc98a9e6ca477f9665d4593c71165ce2f67963"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.353/gal-#{version}-linux-x64.tar.gz"
      sha256 "34a68b09621e90f5ffca0e31767a6f15a2695894216db5805d3e69d901f84b05"
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
