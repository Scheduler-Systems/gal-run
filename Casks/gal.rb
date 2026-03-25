cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.324"
  sha256 arm:    "1bc807b95e1a71a085691c67e2b93d56cc3554f23694dc7411d14b2d12d3cfea",
         x86_64: "33bcb07f493cb12f47d3c972f42aafbf6a47b9f9bb648fbc9f223b12181d5ff7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.324/gal-#{version}-darwin-#{arch}.tar.gz"
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
