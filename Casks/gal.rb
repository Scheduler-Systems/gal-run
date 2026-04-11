cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.568"
  sha256 arm:    "50804ba418a1cc8286541071a58b9fd8b3d81550b20f6f9969341fc1270eea6b",
         x86_64: "504e3f4fb3378911a7dfff40bac75eeb4ef4731d71f80549dd0b3c8e490b6afb"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.568/gal-#{version}-darwin-#{arch}.tar.gz"
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
