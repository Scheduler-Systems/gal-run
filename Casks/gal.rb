cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.440"
  sha256 arm:    "78404eb505ec42b22985c041a38f917cc8beadf5d44eaae970e5c80643c6e2c2",
         x86_64: "87dfed6f2d9f8d1728da1c903a8d0b8d4f029846955f96873ab8b585e0fa62be"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.440/gal-#{version}-darwin-#{arch}.tar.gz"
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
