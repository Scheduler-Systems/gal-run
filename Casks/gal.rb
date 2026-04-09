cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.557"
  sha256 arm:    "fae1d0725a7c439ab0c7d97120c6f6a80d1e628037ebd79e0a0c7ef6dfe6d7f8",
         x86_64: "132bcaf0850dd9ee26887d1208c1bb3e6813af70df83eaab2faf3d03e6460e1c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.557/gal-#{version}-darwin-#{arch}.tar.gz"
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
