cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.466"
  sha256 arm:    "83701163d387a0663bd53374aa3d2c3a98cfb9ebeb86a1bb33137d8a60689dbf",
         x86_64: "332f5f6eb0b5f2e3e3bab8687bcb617aab8390cff0312ea4b679e950536b2e43"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.466/gal-#{version}-darwin-#{arch}.tar.gz"
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
