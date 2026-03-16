class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.281"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.281/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "54433f377a1b8c8807457361d6b136c99ba8ac74291ec471fdf8d652aa392136"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.281/gal-#{version}-darwin-x64.tar.gz"
      sha256 "08fc03bee6c107a061f25a74132b218a0f082bd65c1628e34cf5dced42fc032e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.281/gal-#{version}-linux-x64.tar.gz"
      sha256 "68138a75ca018b7d4ecad11dd81aa24d9276d3008ffb4cf7c5615e3ab2f54a30"
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
