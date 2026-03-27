cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.378"
  sha256 arm:    "365c6fee14cf13f48363ad823b4cfcfbaf236d35b3289bf36a27991e0adff27d",
         x86_64: "18308050e9925082d3c35bf8697ac5c3bb18fa8b95f625c21478a9d403f11ef9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.378/gal-#{version}-darwin-#{arch}.tar.gz"
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
