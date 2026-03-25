cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.330"
  sha256 arm:    "e35d51738f78da66796617ab0e26a3eb75ec8adb1e5c0a078707b6df5cac5363",
         x86_64: "e146a638965901b110e5ea198e958129c75c98c16c250bed77fa7d1128242187"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.330/gal-#{version}-darwin-#{arch}.tar.gz"
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
