cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.484"
  sha256 arm:    "7997cbbdda596cc33206740528924f3302af76394a697fdb9b0229042e684b61",
         x86_64: "c5aa4a4186b23d1877da0c08574893f07b4fe89699b7d66937e2bac30edcb5f2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.484/gal-#{version}-darwin-#{arch}.tar.gz"
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
