class Gal < Formula
  desc "Governance Agentic Layer CLI"
  homepage "https://gal.run"
  version "0.0.518"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.518/gal-#{version}-darwin-arm64.tar.gz"
      sha256 "94d40b215049726e34b855e74038c8ae4e7dd94364454069640c5626b306da26"
    end

    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.518/gal-#{version}-darwin-x64.tar.gz"
      sha256 "684a8f81841d1a8d9fa9bca0414914b7b93f2ad97c1fc09d32ab687de2b5117d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.518/gal-#{version}-linux-x64.tar.gz"
      sha256 "ea929f0658c601f9c0be4b0e7cd7a20ca97fc087e995861cafcf1efaaae1fd54"
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
