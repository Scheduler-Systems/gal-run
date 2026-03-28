cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.391"
  sha256 arm:    "a49a71c58a2a93fabcce9762f6109277ff79fd7f726d9c22dcf67aaf3ce2c0d8",
         x86_64: "7e7531874eb0e990ba8166d2600375963cc64a76de3e8b742cde36bdce26032d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.391/gal-#{version}-darwin-#{arch}.tar.gz"
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
