class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.457"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.457/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "3f0ceb5109c6f2b1c2d1aed563ce4049dd56e4e609b53c9f26fce4f9d922fd29"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.457/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f47d541c04af4619811502cb0d95e62465cb69251873bf528a8d55e8923098cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.457/gal-#{version}-linux-x64.tar.gz"
      sha256 "06c7a1d66b5e19d6dff4f9fac6de895be4bfd6f32a22d7a52d4735c6354f9b2f"
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
