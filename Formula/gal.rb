class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.308"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.308/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0185ae40ad8b372c7984c9d21310df777ed0a3e15ab0c6f7a7135ccdaac8719f"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.308/gal-#{version}-darwin-x64.tar.gz"
      sha256 "1ba95f1885c403e5cbb2b991db104e48b30db3414d1537a2ffa83b68bdc08f4f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.308/gal-#{version}-linux-x64.tar.gz"
      sha256 "2c8e47fe9651b25bb1600c063dfd5523fddaeba1863636a395d15caedf44d996"
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
