class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.349"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.349/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0f6324c0abc91427fc977f40d8680772bde0204b3d747c1a5b45db84e3a335da"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.349/gal-#{version}-darwin-x64.tar.gz"
      sha256 "c02fec6a3d30e346e2436b1343c0644d24b508de35097550f809b88dc24cc7fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.349/gal-#{version}-linux-x64.tar.gz"
      sha256 "5f2165d77ffc304b2fc634e2c414bda9b374a1af7dfb2a3783e2d2015e69eb89"
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
