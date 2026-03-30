cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.437"
  sha256 arm:    "8f2c749e8873e0ef5e2da7b58f954fbd6439068dda69fdf6c356172fbdeca344",
         x86_64: "872610d181ec3c28c012adac3fe151c4db6f97a7fcbbc889f6c4bea131a15b77"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.437/gal-#{version}-darwin-#{arch}.tar.gz"
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
