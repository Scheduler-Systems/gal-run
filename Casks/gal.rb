cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.345"
  sha256 arm:    "a53c88d4f7ac0eb5cdb3f3c7e797961f8d7a6451a7630f1463379f1d6f23c831",
         x86_64: "428dbd955c65146a4965f188b3e7f0aebec0ba82d0b2c8c546d2b98e9dbf10c2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.345/gal-#{version}-darwin-#{arch}.tar.gz"
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
