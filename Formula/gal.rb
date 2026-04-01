class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.501"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.501/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "fbe6912983457804d92d2de14713e9c4cfc4f7821a6979d6d6c8a6f10625d28f"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.501/gal-#{version}-darwin-x64.tar.gz"
      sha256 "2bdf47dced7ccbc7eeefedb173b0929a2b79c57a46966a2b1bbe99a8310663ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.501/gal-#{version}-linux-x64.tar.gz"
      sha256 "3fb453e05db373c3cf651947c2484ad895df78efbfe4c25851ab1e4d07c060ad"
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
