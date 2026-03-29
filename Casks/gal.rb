cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.400"
  sha256 arm:    "a81d84e54849c027d2d9a8a5323293319e16c6ad988cb467965ed3fa0f4b59a8",
         x86_64: "09f1e256385081aa45083cb200847dafc5877e25daf8c89679c94d2c05e1e01d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.400/gal-#{version}-darwin-#{arch}.tar.gz"
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
