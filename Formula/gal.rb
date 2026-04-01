class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.527"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.527/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d39d4b59072935eab3803274a1c2bc076aa735d2d14fc6460517f7f173925981"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.527/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7d66debe1f8cc72ee29f54c679539faf93e595ba1126c1f262135bf565b6a98f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.527/gal-#{version}-linux-x64.tar.gz"
      sha256 "61ce4745fa4b1f2a23c5ae05de3c0843e3779ca8c851d90b9db174fd7f1d543f"
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
