class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.607"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.607/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0832422155abad23c0eda8bfe345447aab8e9f7f168a67d406f9cad506c887ee"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.607/gal-#{version}-darwin-x64.tar.gz"
      sha256 "5c64875a0a8b423163600b84e5558f2963565f3872fa832220165f911b207b70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.607/gal-#{version}-linux-x64.tar.gz"
      sha256 "13628d3b6e22468e7f2f1472d49d778487dccea773c1f5aba3049a21de7aad97"
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
