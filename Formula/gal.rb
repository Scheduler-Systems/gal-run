class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.495"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.495/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "1f637d66c45081bf4b1c2388b33ea8e33ab49914357bc8a057de0a551bad6bb1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.495/gal-#{version}-darwin-x64.tar.gz"
      sha256 "68acfefe82f9625ba0907f2702186aee138d343254298cbb8abd6877085e9813"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.495/gal-#{version}-linux-x64.tar.gz"
      sha256 "67b382047086558888052adbb8b89bf5e536e9f1669048af9f6e951c68e4ea75"
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
