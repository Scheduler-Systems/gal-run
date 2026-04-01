class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.480"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.480/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d551e1cdac6cfcca4e12e89a31ae455f5effc66419607f8a32812c1a142c33d1"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.480/gal-#{version}-darwin-x64.tar.gz"
      sha256 "18b420650845e61c6129a29819832363b5b048bd692335cbc34f07007d8da494"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.480/gal-#{version}-linux-x64.tar.gz"
      sha256 "09e788e8665df15bd4b71f7c4b7748a2a5a049e9ac782a93aaf121a4043d5f31"
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
