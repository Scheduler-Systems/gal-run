cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.421"
  sha256 arm:    "94e2ba8bf4ec19b866fed4b4d85c2863e1b327bfcf47bb1cc963d487fa090bf5",
         x86_64: "68e05560074f0da23f91d3225b56b94e03cf86162d56b5523681954f2070dbe5"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.421/gal-#{version}-darwin-#{arch}.tar.gz"
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
