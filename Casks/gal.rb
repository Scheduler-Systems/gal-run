cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.1.62"
  sha256 arm:    "288a1942fa2cd5af2549091a6e1d832dcd25c0473d6caf0dab4a80fae77e85ae",
         x86_64: "384fdc4c78df6ef8cb38966e297dba787b57ba599fbc4c3a17599224616694a9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.1.62/gal-#{version}-darwin-#{arch}.tar.gz"
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
