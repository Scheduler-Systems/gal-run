class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.539"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.539/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "6e1e4e5ac2de39936d542cdeb25b6cd32b0e7f3637e604deeed66fdfa97c1763"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.539/gal-#{version}-darwin-x64.tar.gz"
      sha256 "f1c6535e4abbd3a54787ad6020cb186259b52da66db0f8e3790ab7d1980f93b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.539/gal-#{version}-linux-x64.tar.gz"
      sha256 "67bf38ad9eed978f5c7eb96cded8751134c4fa291044af961c483589a1feb4ce"
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
