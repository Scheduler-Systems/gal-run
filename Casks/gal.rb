cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.425"
  sha256 arm:    "9ef2f800062261b7c9fdebbf36d329ce668ad7b347d24b3abf3e512434e0de6b",
         x86_64: "9ee31d5572b636ae9ac9370907a839a138bece9349025c404b16e99c1da5e873"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.425/gal-#{version}-darwin-#{arch}.tar.gz"
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
