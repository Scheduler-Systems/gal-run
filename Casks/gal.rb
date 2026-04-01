cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.478"
  sha256 arm:    "299c07ddb4be3c56cb127afd26f07e3e08f6f27a2c4a5d6aef2f45305054fd33",
         x86_64: "2948829186de22512dd80e4bab720612b1c48b43cd9864aafb6f20b3a6557127"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.478/gal-#{version}-darwin-#{arch}.tar.gz"
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
