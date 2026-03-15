class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.278"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.278/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a643f8a642a1f0a57b193577f9e31757274c26097ceb1d8769b1b1da9f9470d2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.278/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8baa2897722b7fff03924968f4d990c7238c8a4488e7c73eaf22bd16eda58ffc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.278/gal-#{version}-linux-x64.tar.gz"
      sha256 "60975349c6014df6ccb38c5e4fa6544de95f7d0dc6b083038e57f53c35d9710e"
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
