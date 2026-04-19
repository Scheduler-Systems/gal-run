class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.604"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.604/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "d7427166ce308a8b6aa5248ab770e2b2dbfe53aa6c618c6a69a2f9bcd30c02c4"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.604/gal-#{version}-darwin-x64.tar.gz"
      sha256 "5ad875dc8e9fafcb7017f4eec3f6a4ff78451c66e1203f926b5c8945c4ed04b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.604/gal-#{version}-linux-x64.tar.gz"
      sha256 "4ef404df3c728adbcb1a47ceac87d992417934d1f9fc31f9062f671225b17a1f"
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
