class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.555"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "a78b214a57622764f38ab8d5bdd720d85d80526bc9428644cb1fd1d82f9dde94"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-darwin-x64.tar.gz"
      sha256 "33754615e7ef801b59c8f32298d4d141b0631bf58077b7d5fa4bbf815bb489bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-linux-x64.tar.gz"
      sha256 "27d4e81a1f7769cb50100df6ad18788ab6ff391b4c3daf361bfddde0daa03405"
    end

    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-linux-arm64.tar.gz"
      sha256 "4ede26aead10cf8696408a80bddc6c91237d3d1ebec128f29cff9ff66ce908bf"
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
