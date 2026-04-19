class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.606"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.606/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d2a48038219aecee7b36216e273d3a397a9e7194d7c03261c691c5a42db41bb7"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.606/gal-#{version}-darwin-x64.tar.gz"
      sha256 "4f13c7e9126a70c109a03c0afdc30c7ab43606644d4ab20776d93bc14f369ba5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.606/gal-#{version}-linux-x64.tar.gz"
      sha256 "fb0b3663352b68671e53866c9138b9501307fda24a5ed02bc4f1ff34588f6692"
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
