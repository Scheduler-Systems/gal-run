cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.451"
  sha256 arm:    "b6dd52a881697bfb9c2385be6cd71a52e37e433f00f1693061426d620191e2a3",
         x86_64: "990c4fa9c18309cfadf7166fe36c0c426440864e7cfe261b98ca29f1bf947e55"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.451/gal-#{version}-darwin-#{arch}.tar.gz"
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
