cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.668"
  sha256 arm:    "ff36d03a61ed20b12b2c602cab6fdf353215f1d571ae90d0dbd65d30f5d9b7ec",
         x86_64: "b1f29207fae0842d44d0a4a2d562b7bcfff8bedfecda278366639371f253652f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.668/gal-#{version}-darwin-#{arch}.tar.gz"
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
