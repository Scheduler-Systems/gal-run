cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.481"
  sha256 arm:    "0719242701deb658ab1b96f518d227beb2c8cd1c9c002c6f56fe07e591934b4f",
         x86_64: "f8455824659a5807168e77399d8c56285f522161016043bc2f566032458c1154"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.481/gal-#{version}-darwin-#{arch}.tar.gz"
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
