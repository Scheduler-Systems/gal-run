cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.442"
  sha256 arm:    "b9ef8bab0aece7756927bb79e6c1e4d8ab6bd5ab7cc0fbe127fc060f87690d5c",
         x86_64: "4738d88b9fd3fcd7656f2f5f2431a4dd00d0bf1f5304cb9e0a02dcbec57c241e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.442/gal-#{version}-darwin-#{arch}.tar.gz"
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
