cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.428"
  sha256 arm:    "c1a671cc50e1425a955d53d51d804812c3edbee139cfc016e935c99e81000df1",
         x86_64: "8d95a3c86b3bbdb61b87c05f811b31c6f357ce1b38877022b620fc0dcb22311a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.428/gal-#{version}-darwin-#{arch}.tar.gz"
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
