class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.630"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.630/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "943fbea54b44c83a981e36bbdf3f9d43f3172db80c35e1c58cd7ad83d51b8fc2"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.630/gal-#{version}-darwin-x64.tar.gz"
      sha256 "fb98332632157a279a16b75c39f1e40e193e4ddd9f58719648eedd635a842ca4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.630/gal-#{version}-linux-x64.tar.gz"
      sha256 "091dc9e6462183d3737e12c2ff60bfc6286c2a319a3480c76e6235db27f9d208"
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
