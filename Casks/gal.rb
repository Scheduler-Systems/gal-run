cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.519"
  sha256 arm:    "5560040369aeb66970cd179208ba552a8e3d675a2dc5f5523a3090e28fee53a7",
         x86_64: "6c98cb95849f416a2964794ca8d1d8981bc875d8d21e6091929c1dc1f42722f7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.519/gal-#{version}-darwin-#{arch}.tar.gz"
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
