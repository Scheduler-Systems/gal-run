cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.561"
  sha256 arm:    "4b7d7531824f494887694d2b2415fb4d4de7048a39fe6894006ef391ff2678f9",
         x86_64: "605fcb2c70a8e5bc38b1a8dfafb732ec4d8e1202df993a848b31a3f50c2da2fe"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.561/gal-#{version}-darwin-#{arch}.tar.gz"
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
