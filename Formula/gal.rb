class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.339"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.339/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6beb423c1483aa76b40efc9e59c036ad152c318bf338d1d776bc3a07008b43c8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.339/gal-#{version}-darwin-x64.tar.gz"
      sha256 "57560950859bd9433557eb1c7d7747843f97873fe0255173ab0cdce9d58ecf70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.339/gal-#{version}-linux-x64.tar.gz"
      sha256 "227f7ebc4f6f6b29eb0dd9666bbfffd9bfeca0f0674e1038cf1b095ddae696d4"
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
