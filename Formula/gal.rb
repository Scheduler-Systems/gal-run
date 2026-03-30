class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.447"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.447/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "79a7f30a192399dbde55268ef279bfa5013f81d19d7b27d54be50fddd6fcf89e"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.447/gal-#{version}-darwin-x64.tar.gz"
      sha256 "38c27f342caf24a8a1fa7502c885b5bbed03f7a980faf1ea0333350e58cddcc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.447/gal-#{version}-linux-x64.tar.gz"
      sha256 "c86dca5d5345f65b6985b392a7248d3e1dbbed97bb57e58a2fdc174f2dc9213d"
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
