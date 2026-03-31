class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.472"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.472/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "4e3c0515f4ce6ff0c4fcd553320511949c749064b4dbb7245ebfa0b78db29899"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.472/gal-#{version}-darwin-x64.tar.gz"
      sha256 "120eba1938e7e053204a0914967de4d946c023975bfbd6d77aaa32b1bf845862"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.472/gal-#{version}-linux-x64.tar.gz"
      sha256 "59d6c540b4c0d50e97f70bdb33c96b79313a67bed6c90cb91bfdf59901ebc762"
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
