class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.491"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.491/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "0f8ad39e53437b790cabe932d24d70142eff31056e9d9f2a5f3945c74218385a"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.491/gal-#{version}-darwin-x64.tar.gz"
      sha256 "8450f4155233f627891520ce0c5c9bd80811bdf44ad1943a53000980652456f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.491/gal-#{version}-linux-x64.tar.gz"
      sha256 "a8a757dc35e0cb496ad563c69e7b2cd76d9c4bc9b8e54c83f6b7b3f9f38fd074"
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
