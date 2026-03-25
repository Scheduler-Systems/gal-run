cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.336"
  sha256 arm:    "29d7ccfc0a7be7adb9b7b2bfe7a304c69b1eaea519115cc5cf72e25f9846d512",
         x86_64: "ecddd304abae8b640beb3bc608071cc4e13043809559d33caff539ed89e7e7b2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.336/gal-#{version}-darwin-#{arch}.tar.gz"
  name "GAL"
  desc "CLI for GAL — AI agent configuration governance"
  homepage "https://gal.run"

  livecheck do
    url :stable
    strategy :github_latest
  end

  binary "gal"

  zap trash: [
    "~/.gal",
    "~/.config/gal",
  ]
end
