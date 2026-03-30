class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.441"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.441/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "e249e8d146ad09a22a70cf1d0057bcacaf3b27948ca34ba8af0d4c0ff20b72e3"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.441/gal-#{version}-darwin-x64.tar.gz"
      sha256 "40cb0ca4fa889701bb563814b357861eb55b5d9a5f5314e69d244f9604242903"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.441/gal-#{version}-linux-x64.tar.gz"
      sha256 "f2555299f4ab806c854ae300eaf6e677426b095b5391290f5e7931fdb6308d2f"
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
