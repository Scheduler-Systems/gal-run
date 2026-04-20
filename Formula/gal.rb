class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.608"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.608/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "8fbba376109eecfae0c511a49bb6178c61ee466b3af709537c728da5d230bd5c"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.608/gal-#{version}-darwin-x64.tar.gz"
      sha256 "61d85998e479bc581bdc39f75eae45579b584fce0f26b39048e637f63278cc70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.608/gal-#{version}-linux-x64.tar.gz"
      sha256 "9db441445b2de237e449f6e3536be7fb7dd34dc50540f8e48d31856b01b9cbaa"
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
