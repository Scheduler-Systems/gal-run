class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.526"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.526/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "324c4f890337e547fe2cdcbbf4fd1071c17d75e6c895ba2a738becdec98cb777"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.526/gal-#{version}-darwin-x64.tar.gz"
      sha256 "1bd3489462cc6e77be103c73d6a9fcc8aac41b9b7e6f5d9ff000a1cdd318e743"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.526/gal-#{version}-linux-x64.tar.gz"
      sha256 "d7ceae158fcfb30adaac93ea753faf66dc510d85c21dda6c783407d9a51a2ab1"
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
