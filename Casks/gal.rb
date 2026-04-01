cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.482"
  sha256 arm:    "3cc58c2e93cee337c74b619b0627e4874fc5b9f2db49fa4492624688bb604ab8",
         x86_64: "6659404e0835194f644007cfe9f25f378679552da8a5fb574002e5529e204ea1"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.482/gal-#{version}-darwin-#{arch}.tar.gz"
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
