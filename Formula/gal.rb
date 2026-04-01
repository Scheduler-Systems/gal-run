class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.478"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.478/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "299c07ddb4be3c56cb127afd26f07e3e08f6f27a2c4a5d6aef2f45305054fd33"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.478/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2948829186de22512dd80e4bab720612b1c48b43cd9864aafb6f20b3a6557127"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.478/gal-#{version}-linux-x64.tar.gz"
      sha256 "8f4830b36de7ba99d9bb46a80fbacc7189119817c6a1b5e4f6b7f2de79d1f278"
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
