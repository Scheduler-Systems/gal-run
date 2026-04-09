class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.556"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.556/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "b12bd215ab39c5a2ec1d601881c803e562d3b07f0518b62c45097125b89fadba"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.556/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8aa1a35504db08a8c5a246d2063ed695685151579c622ef36977e702ac0dc0a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.556/gal-#{version}-linux-x64.tar.gz"
      sha256 "d018cbace62ad95eda953f3fc5d961aaa6700072a6cc38fb59b58458ab303bc8"
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
