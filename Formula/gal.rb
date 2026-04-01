class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.487"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.487/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "33bf5cbbbd2bef1291976d360f8a0dd7bac71d1d882fe64d3bb8e928fc6643b4"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.487/gal-#{version}-darwin-x64.tar.gz"
      sha256 "890f9b89bade23d96a2aa9df09d9cd387b6afea672fc874333cdc6091754ade9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.487/gal-#{version}-linux-x64.tar.gz"
      sha256 "06e7784f9867fabac9327cf184f547f466eb2cab1119100d2a87b6d5d10ee997"
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
