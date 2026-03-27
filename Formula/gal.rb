class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.371"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.371/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8be32dffc1e254958c9248dbaeef1b808bdbf9b07ad7e5a0a9a2650628a6687a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.371/gal-#{version}-darwin-x64.tar.gz"
      sha256 "fde76447b0b604601798a4e03030df2239d5dada4bd79c6b3188b7f46e18ba13"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.371/gal-#{version}-linux-x64.tar.gz"
      sha256 "a187c7e08e661c52ebaa114e2fc100ba97c01bd4349bb0a65455276e323d8bbe"
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
