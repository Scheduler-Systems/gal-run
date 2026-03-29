class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.399"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.399/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e6a7ebe9ef6a50d048bac81bb63f8f4b7da26892ce79d2fe93b077e9c10c09a2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.399/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c5507e79f200dd27aa5b7991f7610c4af1823fd5e7f97f36e284b67f448fc0a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.399/gal-#{version}-linux-x64.tar.gz"
      sha256 "c6f53af81894b428a45d8f046c0c2338232d84cc2a3f6cd67c816490fb5ccc61"
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
