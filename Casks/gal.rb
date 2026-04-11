cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.569"
  sha256 arm:    "3eb83b6d4c424258167a7ea1ea8d71672a67ebbccbf0ba50b96bdb8f5b0910c9",
         x86_64: "29857b5e1619d09f11bb2171abd686ca4586b20425339daf9c5acda8659b1542"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.569/gal-#{version}-darwin-#{arch}.tar.gz"
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
