cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.385"
  sha256 arm:    "673ef18b1042c471316eefc3726913b193e2ddabcf78d5cde04e20a879f705fc",
         x86_64: "b424faec74c296d9ea59b3eefb166178cb47d201e71bb7d9cc875ff9a25b5a5a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.385/gal-#{version}-darwin-#{arch}.tar.gz"
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
