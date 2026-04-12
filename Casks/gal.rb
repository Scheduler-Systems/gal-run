cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.572"
  sha256 arm:    "e3063318a77cbcb6420197fac7e56f38e0a19275424324b9039cc2507e05b16e",
         x86_64: "6ab413c76a3e57ce8c19f15eb0c64e01a94114249d599bfc222c719b7b49094b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.572/gal-#{version}-darwin-#{arch}.tar.gz"
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
