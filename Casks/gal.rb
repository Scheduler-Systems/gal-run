cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.597"
  sha256 arm:    "2eb394f56c9dd27263790df9ba19b5349f7525f2d5fa1ae08bda745d7a27218e",
         x86_64: "7620021aff80f2057a1bea4872334dd115a48f05502f0692b2ffcbddc2409524"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.597/gal-#{version}-darwin-#{arch}.tar.gz"
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
