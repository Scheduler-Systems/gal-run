class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.361"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.361/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "ce2a78a32693d913e3d63b2d7ee79ad3a8b89377426aff61e52bf78cab094266"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.361/gal-#{version}-darwin-x64.tar.gz"
      sha256 "d5f814c2205f24b7bf474c112dc75f0f34ad2a76c9f5519b5ee1910bfb4ab55a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.361/gal-#{version}-linux-x64.tar.gz"
      sha256 "e1b521f3584a101a56cd2a1543447839d6ddef746a7b5b3bc585aa2806d21c4a"
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
