cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.429"
  sha256 arm:    "5ba9992b9bcd021dcbce93a02d1f1bec27caeb087bed3477d3443fbc0e09ae53",
         x86_64: "7f76dec392861c4746b1d57cf83ce3bf2493d13628f6ec28e7e16dc33a7fd5ff"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.429/gal-#{version}-darwin-#{arch}.tar.gz"
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
