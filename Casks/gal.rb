cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.487"
  sha256 arm:    "33bf5cbbbd2bef1291976d360f8a0dd7bac71d1d882fe64d3bb8e928fc6643b4",
         x86_64: "890f9b89bade23d96a2aa9df09d9cd387b6afea672fc874333cdc6091754ade9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.487/gal-#{version}-darwin-#{arch}.tar.gz"
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
