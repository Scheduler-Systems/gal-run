cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.540"
  sha256 arm:    "f2d22a151d50d3cbcf4cc848fbf5ffe4b0802175d5da4b5043a0581e75d1ce30",
         x86_64: "bcd4bb7b9443fd7e12b56e672fde21c692d6a9e87ba147e180bf2efa4282e4b5"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.540/gal-#{version}-darwin-#{arch}.tar.gz"
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
