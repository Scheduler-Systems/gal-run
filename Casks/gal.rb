cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.599"
  sha256 arm:    "342aefd159fa7796ef2cda3b4be119e525b0396fb69097c9968e988dea3e3582",
         x86_64: "8f8e8efefc1f4dfdb254b674719b840f1af05e7acdf2fb132a55fad0d8069d91"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.599/gal-#{version}-darwin-#{arch}.tar.gz"
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
