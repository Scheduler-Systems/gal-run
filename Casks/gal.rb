cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.397"
  sha256 arm:    "04c4be78b94480d73a26de0099d6eac11a21b8851cec1c22f28fb5db2bc5442c",
         x86_64: "c1362f7ce9b48360d35fc3db38d7c0a16e761f171cb00c30229ea83f33bd2186"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.397/gal-#{version}-darwin-#{arch}.tar.gz"
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
