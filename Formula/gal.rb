class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.553"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.553/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "5ddf88a4b1f8f18a3bc5abbc518b8ec36dcca4c14f7d4c9830a1752c020ae89a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.553/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8d0cc160fca0e68e3254d25707d80b90fb1eeaabe658bf176e8e883378d7c53d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.553/gal-#{version}-linux-x64.tar.gz"
      sha256 "4c2273ca0ca3b6048cc1ccf9fa9e8b93a9eb96932a8dc601afdbeba5cdc5cefc"
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
