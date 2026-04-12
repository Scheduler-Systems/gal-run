cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.575"
  sha256 arm:    "943f5e4746bec00888da05a4438dbf0283ba0fa94fc6ba1d72f5149612b3ad3d",
         x86_64: "19c5751bc1b319274932db6daf49e4979a9c26a70d4209a849737fa2ad986ad9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.575/gal-#{version}-darwin-#{arch}.tar.gz"
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
