cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.435"
  sha256 arm:    "79349ab0b6a05714d12dc73edeebd68eafa7ff5f4d66bfe68d9e5274bfa06224",
         x86_64: "e01b27b5ffd1c00dacff239917e157d84054a337b72c6b042306e7b3e4c8e63a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.435/gal-#{version}-darwin-#{arch}.tar.gz"
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
