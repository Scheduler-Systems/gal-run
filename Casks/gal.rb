cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.554"
  sha256 arm:    "26f72f9660a2d3a458769c13ccb08fd9141faa85459293edc99f90428976a9c1",
         x86_64: "0e819c0229762c46e6537c115ecf34a1671f2a11c506dc8a9e9c4c0607174911"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.554/gal-#{version}-darwin-#{arch}.tar.gz"
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
