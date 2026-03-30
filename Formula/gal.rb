class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.439"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.439/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6dd53eeccea084e4e159f1fa5cbcd0d9dd33948c413422a8a9a20f5c09c7e699"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.439/gal-#{version}-darwin-x64.tar.gz"
      sha256 "26596aaf4547372af6f65bf0d933d47ccb8def8da7011e8a0db9cf4a6caa0f13"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.439/gal-#{version}-linux-x64.tar.gz"
      sha256 "0af8e5fbbf8addacc7ed3fe19a65cca145e2337e210786ab868239b09cbbfc94"
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
