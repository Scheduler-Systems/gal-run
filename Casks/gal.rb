cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.395"
  sha256 arm:    "c7ac4ed8617c491bcdfb2a16a7ff28af884cc4a6420b1efbe92325aed96b7b1a",
         x86_64: "d032b61061bbe2d6ce897cd29636cf0f351eed319b5bdf37eb4cac4aff6ba1dc"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.395/gal-#{version}-darwin-#{arch}.tar.gz"
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
