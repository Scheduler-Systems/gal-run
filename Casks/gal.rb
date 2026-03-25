cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.338"
  sha256 arm:    "286a44697866b29a6c64463d9e919ffcb95399b02d513085af5479da64ebbb8b",
         x86_64: "d6967e176a2427d38a9fbdfb13cf68fe3c26f366c9ba1772175c272f93c3167c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.338/gal-#{version}-darwin-#{arch}.tar.gz"
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
