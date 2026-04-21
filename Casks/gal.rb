cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.610"
  sha256 arm:    "061d808d3e47e2c3b27406ee0d6603e5287a82bbab897bcb822b589c9e2de70a",
         x86_64: "da6c166ecaad65f3629bed58ab4887809d6a970c650ff0e95cd0ce698912f332"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.610/gal-#{version}-darwin-#{arch}.tar.gz"
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
