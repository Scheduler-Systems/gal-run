class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.515"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.515/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "009f21d8033620e402fd5476f6c4469ce46cc843ec80cc9657b96e9ce183d59a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.515/gal-#{version}-darwin-x64.tar.gz"
      sha256 "48325c420f2686fd358ff03051e4b55a7558557dcdaa93511781c27dcbe3a8d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.515/gal-#{version}-linux-x64.tar.gz"
      sha256 "fff8d8d67704445b1b01767b6b0ed3c066e7222fb964a793b1fc85f234946790"
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
