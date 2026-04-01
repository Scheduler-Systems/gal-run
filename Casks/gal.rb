cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.477"
  sha256 arm:    "a9b559fd46ef5fad5f7ce3172b47b2e842d5758819e7253f87fdcf676dd71f0b",
         x86_64: "0795838d6614a5c52d2fc3f8e6d8d10ae232a84c49946d51e83c9c038eb3c333"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.477/gal-#{version}-darwin-#{arch}.tar.gz"
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
