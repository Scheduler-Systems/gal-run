class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.358"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.358/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e08e6a13e540881a3647c83f40cfd9ddb12d5aa12512f3cc53b02630d187d3bb"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.358/gal-#{version}-darwin-x64.tar.gz"
      sha256 "9e1e19939b8732a35d5620e85f8abb3b9d27a6a7a98aa25872dd17e29c122ec8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.358/gal-#{version}-linux-x64.tar.gz"
      sha256 "15a175fc099e1077540b183b4aea2224959257489ed079157df964ba4ba0f7c3"
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
