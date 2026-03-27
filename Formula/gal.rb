class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.378"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.378/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "365c6fee14cf13f48363ad823b4cfcfbaf236d35b3289bf36a27991e0adff27d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.378/gal-#{version}-darwin-x64.tar.gz"
      sha256 "18308050e9925082d3c35bf8697ac5c3bb18fa8b95f625c21478a9d403f11ef9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.378/gal-#{version}-linux-x64.tar.gz"
      sha256 "0a38c6fd371c163879ce3e6712fb07ae65df48e013a7dda29ec4e01ce71555e7"
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
