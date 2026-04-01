cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.517"
  sha256 arm:    "ffc4e3a6a8137cc87021d88a4f850bb21bda040732d767708a2e5219f2161742",
         x86_64: "f0947dc8f78ebf8a9276e51474998c1be912fc5eff20c6439cd9f19bcd62292c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.517/gal-#{version}-darwin-#{arch}.tar.gz"
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
