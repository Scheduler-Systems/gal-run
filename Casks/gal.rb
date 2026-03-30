cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.444"
  sha256 arm:    "d0dd82f9ded527a96f54af5879c824dce04796f52d5af23a4f1248a397099b69",
         x86_64: "053a617b0684b2dbf5e5ff1a5c46a14c1b7b6e6848a75ad8a4cf92047973b1ae"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.444/gal-#{version}-darwin-#{arch}.tar.gz"
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
