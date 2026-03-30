class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.443"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.443/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e03e3fcda3aa892144c6a54ceb35e65122c685ebfa0d41d7468d072b51df0596"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.443/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c4db9f1bca1088ea405b705497e4d78e7e3e425784d8d4e30a3b07414e02b5cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.443/gal-#{version}-linux-x64.tar.gz"
      sha256 "2721f9bb10c4c1c7d3ceb247dd48a25888abc5ff9eda6ed08d958b15e682d4d6"
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
