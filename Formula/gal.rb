class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.520"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.520/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "77fa84723bbfebd44dbfad7543e22581f8ad60b3ee83b9cdf5d657aeac56fece"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.520/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c44f59925b5d8d952d027f72455fd3abc12193782f47242de43ab27ad28885c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.520/gal-#{version}-linux-x64.tar.gz"
      sha256 "3372b9f93f25a4ba24537b05ba8e0dcffa3b1c61baaeca51ec6a7437261694b5"
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
