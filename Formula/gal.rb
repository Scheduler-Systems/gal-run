class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.327"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.327/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "42e16267ab659d0f4001ca7a77b7427e08cde43c8f0b1802de1de368c59be116"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.327/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6d6237e6b73bbeb3cc5dfbd1e890ddc5a3d8ae364d08ae4eadf9dcaacbb08c44"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.327/gal-#{version}-linux-x64.tar.gz"
      sha256 "f0e1ece2de97b29b65ed7368e77ca4b89451691324179a584abc06d155b8227c"
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
