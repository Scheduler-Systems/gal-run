cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.430"
  sha256 arm:    "30d60a3ea293330ebb15165a70dbba0ae2d005ab1bc38ae8e708afb57d03fb7d",
         x86_64: "70fbb2cbdb3064f539860ef5f1b290bf56692df4595b1f3116f332955d28ea30"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.430/gal-#{version}-darwin-#{arch}.tar.gz"
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
