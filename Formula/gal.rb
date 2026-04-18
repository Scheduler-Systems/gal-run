class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.598"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.598/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "412e5c3b133ba7b65af5002ff31b4cabb39bc9f488a05ded456d18ee5f282ab9"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.598/gal-#{version}-darwin-x64.tar.gz"
      sha256 "7007b049ff0d266ca1fb7398cca5bafb2383954cb97d209cff612765817ddba1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.598/gal-#{version}-linux-x64.tar.gz"
      sha256 "acdc7f9ce0dbfdd69aa358f33bab30977645da828daaba9770f5d6a53d0692dc"
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
