class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.559"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.559/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "c934dccf181535f21cd827da8a42f7085e51188b3d81b2004983f6fba33ada76"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.559/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2ee59fbc6d4b2d9f9ce9a84b748668c616e1d0abf1adc7ae74e88691dab2cfc8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.559/gal-#{version}-linux-x64.tar.gz"
      sha256 "54544a2d7327294c413a3809d793d4f8a7b7a62e32426bfba7177cee2a1ec286"
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
