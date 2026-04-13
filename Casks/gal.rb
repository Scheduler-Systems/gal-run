cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.587"
  sha256 arm:    "e706716f2bd7198db40f1c2ea3a6692d3356bde51921227337b162a2e0952b72",
         x86_64: "51688b2adfaf089e116826978bcd0bc63c3feaf7fd0505e6b0326143b67bfb83"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.587/gal-#{version}-darwin-#{arch}.tar.gz"
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
