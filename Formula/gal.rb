class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.514"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.514/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "97bb8170bc7bf38f685da6ffd1c74ac62508a7de6ec4a768781a4da25e4b7ee5"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.514/gal-#{version}-darwin-x64.tar.gz"
      sha256 "0105399120d38281883ccf3bafa67aaaf82845a53b149fbea262de9b83f4c4ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.514/gal-#{version}-linux-x64.tar.gz"
      sha256 "47e4fb4d28fe6999c0ec8bed98e48a99ef40dbd14ab93f9d17fb63fa1b52ed6d"
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
