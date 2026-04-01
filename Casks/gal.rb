cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.475"
  sha256 arm:    "8287819f7966973791b1bfee20b66be6cc2da813cd9aedfa395a4588486eb765",
         x86_64: "048cd47f7b0d0e5cf2305a6bd8b7ad03dc57a15aaeceb55adc4340ad07605eea"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.475/gal-#{version}-darwin-#{arch}.tar.gz"
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
