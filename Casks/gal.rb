cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.573"
  sha256 arm:    "dec8d4e2de77e718c1ed260d2eb3fb2a58f175acb63aaf71e5fbaed51ed7bc1e",
         x86_64: "12c2c96422e31db1a864e63692e17da386141c01c6a094059ffa484c4d246c1a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.573/gal-#{version}-darwin-#{arch}.tar.gz"
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
