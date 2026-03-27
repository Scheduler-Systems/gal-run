class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.369"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.369/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "dd5d4effbb3e15368677c9035b3b92b3f3da6d0e21bd91a37ef74f82b2a46d89"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.369/gal-#{version}-darwin-x64.tar.gz"
      sha256 "225661b770d69235a086dc264d1be005eddff4892aef9cc17eb3ef2c1d42ac98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.369/gal-#{version}-linux-x64.tar.gz"
      sha256 "9194bb31cd01cb6db102604ade6319013c3cf1a8967568432669d54dd9e6c11c"
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
