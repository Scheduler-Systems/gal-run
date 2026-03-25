cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.326"
  sha256 arm:    "60049a049e7d928d067fe59b9c073ea53320579338b6e399b0ea6f54bdf19721",
         x86_64: "3f600f6d60a33875e194df4dd36592029ff8cd315a5dc0ff058f2c10a0bdfb6b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.326/gal-#{version}-darwin-#{arch}.tar.gz"
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
