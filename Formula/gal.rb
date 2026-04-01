class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.503"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.503/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "15e5be145fb6793b2631e27751832f52730f424cc66f369d9fceb277f1fd471d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.503/gal-#{version}-darwin-x64.tar.gz"
      sha256 "614e2048d8e2b94f4faede4bd0275375d61bf290bbd86773a899f3fa54de64c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.503/gal-#{version}-linux-x64.tar.gz"
      sha256 "4457de8fab5121d07f54a034692912e8d4f1f121f319f2f7d1797f280eadbbcb"
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
