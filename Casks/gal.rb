cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.506"
  sha256 arm:    "ad4464f3dba40e316d24a53a820c53e747bd7487fc0e35ace2b786c5a15c3cea",
         x86_64: "b0066a8e5c1a8c9a551debde2863207d10b6bf3385d1ac411b643c4ee64e6575"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.506/gal-#{version}-darwin-#{arch}.tar.gz"
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
