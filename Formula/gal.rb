class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.449"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.449/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "5f47b8cf36345e7689a3e8ae5a93d2333028b97955a25483bdd82fd674823523"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.449/gal-#{version}-darwin-x64.tar.gz"
      sha256 "71a942956217d0d8cf7266fb9d2e88686ac05b83ab5473f3b0f59a647273bcee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.449/gal-#{version}-linux-x64.tar.gz"
      sha256 "571677332d1e81a31fa0b768f4c79776271654a33658956ff127800c037a1100"
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
