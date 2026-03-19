class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.309"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.309/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "59e8190ae3d08e482d36cb7fdd058dbc10650073718fc1722457f93fe47cfff2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.309/gal-#{version}-darwin-x64.tar.gz"
      sha256 "9df85c0dab09726aa0316f05018f637d2317da19a082e3591d098436ed9baf50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.309/gal-#{version}-linux-x64.tar.gz"
      sha256 "746bc7c93e78cb43a89407944927be00312f3f7bab182c50f264e3118f46ee84"
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
