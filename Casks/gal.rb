cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.516"
  sha256 arm:    "dde45e012989f89ae82b546b9b63b908a14f664549925bd26de85e97edb55e7c",
         x86_64: "23d35ec360bf30a594692f198fdf1b9b77b961a53e3b05106fb965d0493e56fa"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.516/gal-#{version}-darwin-#{arch}.tar.gz"
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
