class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.318"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.318/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "90d5b941afcf957beb5dfc59dfc0dfd899d7329128002a190f02617e1867360a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.318/gal-#{version}-darwin-x64.tar.gz"
      sha256 "ae5e12d8083d3cf598235697848ad53c87c9d39a5205ade5f24b8761e074e8d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.318/gal-#{version}-linux-x64.tar.gz"
      sha256 "d3e2b0a3b42baedb8d5ffc50efac45a910034a034d8c3800d8f72283de36f0f9"
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
