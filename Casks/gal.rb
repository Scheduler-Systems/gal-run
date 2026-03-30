cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.439"
  sha256 arm:    "6dd53eeccea084e4e159f1fa5cbcd0d9dd33948c413422a8a9a20f5c09c7e699",
         x86_64: "26596aaf4547372af6f65bf0d933d47ccb8def8da7011e8a0db9cf4a6caa0f13"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.439/gal-#{version}-darwin-#{arch}.tar.gz"
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
