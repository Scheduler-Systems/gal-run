class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.445"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.445/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8aafb87df53aa66b4a5cf8e6c048c0d11d6f1ca286e81f9817cd5e47b0ab5811"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.445/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2730ae0cf0c762aef9a8f8b58622f34b64377a5851d4c9af3f3b331bd0e247a8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.445/gal-#{version}-linux-x64.tar.gz"
      sha256 "d35e7669b665ae723e06216e268fbf236768cbb465828d0403fce1a9a8e5951b"
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
