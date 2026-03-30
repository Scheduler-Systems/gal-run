cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.434"
  sha256 arm:    "af93abe1044a380a9e59c270141f3d91debdfe3a142ac159971cc2d0be68d7b6",
         x86_64: "5329f965799abbdfb6049ffe667069b7ecfc616bc93c06ff6c55c93edf916358"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.434/gal-#{version}-darwin-#{arch}.tar.gz"
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
