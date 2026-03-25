class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.326"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.326/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "60049a049e7d928d067fe59b9c073ea53320579338b6e399b0ea6f54bdf19721"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.326/gal-#{version}-darwin-x64.tar.gz"
      sha256 "3f600f6d60a33875e194df4dd36592029ff8cd315a5dc0ff058f2c10a0bdfb6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.326/gal-#{version}-linux-x64.tar.gz"
      sha256 "f3e252cb1ef2f4ea3a72170c52b16f87992b9cddd1bb28ed3176c4dc822377d3"
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
