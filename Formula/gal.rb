class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.307"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.307/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "bb151872638f51c14850dc2b6d93ee6b60c84a0b67374181e61a79c82ce1e149"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.307/gal-#{version}-darwin-x64.tar.gz"
      sha256 "29d281bd18d7c9d9234905e3768be8c159305ad1be5ea8e3660d9d843023372e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.307/gal-#{version}-linux-x64.tar.gz"
      sha256 "d08d89e95426d1b848ecc49cbce44aeb57aec57c170f48391d11b1022e0ee285"
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
