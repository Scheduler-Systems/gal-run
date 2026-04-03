cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.542"
  sha256 arm:    "7b7ffd6e57bc2e0cb0790f73f0f99dee73ac79338e4fdab13f6c7444a1b73e79",
         x86_64: "3be499b230501e31afff9bfd034f12aa3eb0da772eee025c7e8549a71b010316"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.542/gal-#{version}-darwin-#{arch}.tar.gz"
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
