cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.489"
  sha256 arm:    "6f2bd758b9359a5e71c0cb42648b519ae3ed8616c59465a857017918324fceb6",
         x86_64: "fd455defae289bfeffb755fbb20ed6d0eac534b241029fbf111f33ae5987983b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.489/gal-#{version}-darwin-#{arch}.tar.gz"
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
