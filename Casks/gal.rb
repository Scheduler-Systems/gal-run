cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.543"
  sha256 arm:    "1209baf6e27ad33c8868c267c40e526de906082a8a440872922577997d7d2967",
         x86_64: "0890d1d0444347a56ba841a58b1ef40ae17e8c05bcc515c2f669bccfe5c02d64"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.543/gal-#{version}-darwin-#{arch}.tar.gz"
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
