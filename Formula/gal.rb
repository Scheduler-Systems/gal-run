class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.482"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.482/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "3cc58c2e93cee337c74b619b0627e4874fc5b9f2db49fa4492624688bb604ab8"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.482/gal-#{version}-darwin-x64.tar.gz"
      sha256 "6659404e0835194f644007cfe9f25f378679552da8a5fb574002e5529e204ea1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.482/gal-#{version}-linux-x64.tar.gz"
      sha256 "b89a52a88fd57ec78e76ce38ba9a106e9879408ab803703dd01b0d402e3f3b20"
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
