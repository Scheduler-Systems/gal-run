cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.322"
  sha256 arm:    "e9c723f6f3693927c8051e8e31159b606b3534044bfa1307f11622950fd85700",
         x86_64: "0167638e0ef317265a93298ed4cad52e3e060339cdee5c084f2a06562ec1ba50"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.322/gal-#{version}-darwin-#{arch}.tar.gz"
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
