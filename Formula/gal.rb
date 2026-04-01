class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.508"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.508/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "9bf5290fc6101fb5e627270ec535c130e0bf51de5d15b421a0c81b84d4d4f9e6"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.508/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6ffb24256f4e078ce6f65fcd500890ceb0c69b5de5ad66e85e8d05211e26afc4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.508/gal-#{version}-linux-x64.tar.gz"
      sha256 "8be3d1847a1e54831604f423c3491fad2690ea0de6cafb444e47e15d3710ec56"
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
