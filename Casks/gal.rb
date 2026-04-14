cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.589"
  sha256 arm:    "6e836853431f8d0de08c0b743d98e159c0da80d1a0e0ff7ac72984b9c7a4a37f",
         x86_64: "40851e37e05588697ea38f720afb0700210ba05a5b2c64312379979f82f8a4ca"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.589/gal-#{version}-darwin-#{arch}.tar.gz"
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
