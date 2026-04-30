class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.663"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.663/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "9303c6340cab852edc766c057422880445fb3d08d216be1f007bd766e7b21835"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.663/gal-#{version}-darwin-x64.tar.gz"
      sha256 "83d0bb720881827a13b50a6b359f1a1eb2535afeaa640f2ec6b4d100332599db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.663/gal-#{version}-linux-x64.tar.gz"
      sha256 "05953aa041288de8256977693adcb0aae5859f76675ceebec9b4b30c60486138"
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
