cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.504"
  sha256 arm:    "ff08bf46aa38322a2e1d85cbd86b9471fce84d22dce60c6d55e7e1b8052d1eff",
         x86_64: "350fe7ce733b3ed61522121e20b8dc26e53fabddb988db9216fa002f0beb8120"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.504/gal-#{version}-darwin-#{arch}.tar.gz"
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
