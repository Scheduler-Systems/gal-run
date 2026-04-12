class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.570"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.570/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "9fcfb9e0db0d099f4576220621c787664bb10e0d5c5831b6da034dfddc5c1723"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.570/gal-#{version}-darwin-x64.tar.gz"
      sha256 "629abe4a3ad214806a2869e11cb19a15077be3d20aaa69e81874cab6dc999840"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.570/gal-#{version}-linux-x64.tar.gz"
      sha256 "64c59b7e9c353b1b332a686bc793c022a0e230126e00b32384517d3512e46358"
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
