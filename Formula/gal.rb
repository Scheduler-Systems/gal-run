class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.489"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.489/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6f2bd758b9359a5e71c0cb42648b519ae3ed8616c59465a857017918324fceb6"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.489/gal-#{version}-darwin-x64.tar.gz"
      sha256 "fd455defae289bfeffb755fbb20ed6d0eac534b241029fbf111f33ae5987983b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.489/gal-#{version}-linux-x64.tar.gz"
      sha256 "6bd415764267ed5340883f1453bab5d31cbe4ba44781991f5ba5933b6a974edf"
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
