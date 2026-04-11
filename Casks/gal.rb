cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.567"
  sha256 arm:    "ec09ded5bca691019d98b0a8f935e650d3896955922c85bad26e0e84e77d222d",
         x86_64: "56414068a72125c460bde1361bc25b7530a5e508e51c2c80a3df314d02689e88"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.567/gal-#{version}-darwin-#{arch}.tar.gz"
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
