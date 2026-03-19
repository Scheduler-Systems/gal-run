cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.316"
  sha256 arm:    "c8ddc9be1ff7e1cb279069cf220fc9d25d68449992812e020d582658415107d3",
         x86_64: "39fa3c492b9d8b05222d0c7cb3c2652b17083d57937073d697906d5624359c9e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.316/gal-#{version}-darwin-#{arch}.tar.gz"
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
