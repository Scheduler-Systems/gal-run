cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.496"
  sha256 arm:    "c8e104b4a1a8db82d55f77b28a416010c2cc4ed3d7e436ff2599d988bfbb429a",
         x86_64: "061c82515c73018d9c2a1144e6c930df9146a4b89f66ab44ebd5cc676906ca46"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.496/gal-#{version}-darwin-#{arch}.tar.gz"
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
