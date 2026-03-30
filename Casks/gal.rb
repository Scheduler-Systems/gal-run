cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.436"
  sha256 arm:    "ae8a6d65c5a25eb3b30b49ef1e0306fc80fedcb25be830eff2a75ee23acdcc9e",
         x86_64: "f59b92580eda207675a285021dc60b693be52b8753f9ed95bc34163c3f3dad10"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.436/gal-#{version}-darwin-#{arch}.tar.gz"
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
