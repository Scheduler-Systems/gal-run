class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.310"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.310/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "18a5187fc4b529d2965b83535c2c4a132df3313d028d8c6eee31d3e1cabdc54d"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.310/gal-#{version}-darwin-x64.tar.gz"
      sha256 "51d82cbc7640083a5f647713017b68a411699a41ad8fbaabadb1e5fd0dfff0a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.310/gal-#{version}-linux-x64.tar.gz"
      sha256 "7113632f0c2f7e5305464ccdf03a309443ec3e76fe985f1aaa062bfbe38f1886"
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
