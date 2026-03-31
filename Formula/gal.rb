class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.468"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.468/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e260d0db203356b574049417f343604d8a20792aad7099e8c9e523de0101f6b7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.468/gal-#{version}-darwin-x64.tar.gz"
      sha256 "a738a3c0aed98dd68c5891de0953c543ff0c180146f37a7ec8bec7ca6f4a858b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.468/gal-#{version}-linux-x64.tar.gz"
      sha256 "ee9fe4d751a8eedd730214730289f16ab09ee55078c7551e4a458843338523da"
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
