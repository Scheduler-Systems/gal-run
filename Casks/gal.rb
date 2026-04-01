cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.521"
  sha256 arm:    "e1115a1856dbbb43331e35eb5fcefb5fd7dcdd1c4240613465fe9720cd426cf9",
         x86_64: "3d3d9740d9a3af9b4370995cf01326ca4b73bc8a8c9a1f603b1b009cf956bb41"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.521/gal-#{version}-darwin-#{arch}.tar.gz"
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
