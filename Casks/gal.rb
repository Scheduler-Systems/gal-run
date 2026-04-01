cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.522"
  sha256 arm:    "ce00fc23e8926403a3fde3193cf45d74024151575924f75a420e7664ad628597",
         x86_64: "c36517b1cf7cf28ce134c25916f4b52a18da2282ca7823a0b359bdae85c66827"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.522/gal-#{version}-darwin-#{arch}.tar.gz"
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
