cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.609"
  sha256 arm:    "4e03c61c06021304896332181aa349332ff54313b6670f2d5a8dc06bd8bf50e9",
         x86_64: "5d2f64be704e1d815c4092d919b78476676b53f0b2b55da583f98f548aa05063"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.609/gal-#{version}-darwin-#{arch}.tar.gz"
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
