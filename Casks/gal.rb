cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.628"
  sha256 arm:    "a8f226736d8b6059b880f85a5fab18807d75093291fc3d6186df4d817380cd3a",
         x86_64: "4c4b64ebf76ee28e3c9371a8f4b268b7759d58a2a0a0bd80049055542b0cd18a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.628/gal-#{version}-darwin-#{arch}.tar.gz"
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
