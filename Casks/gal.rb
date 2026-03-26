cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.351"
  sha256 arm:    "30e1b2ab636c26ea6efac0d70cacfa08a9f9f07e3fdb78b5dea398cc06da26c0",
         x86_64: "d60b6f49f10c172e3c02635c6b986e39d00be72974b806a6714f5dd74281f4af"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.351/gal-#{version}-darwin-#{arch}.tar.gz"
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
