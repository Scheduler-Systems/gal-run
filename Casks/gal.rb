cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.570"
  sha256 arm:    "9fcfb9e0db0d099f4576220621c787664bb10e0d5c5831b6da034dfddc5c1723",
         x86_64: "629abe4a3ad214806a2869e11cb19a15077be3d20aaa69e81874cab6dc999840"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.570/gal-#{version}-darwin-#{arch}.tar.gz"
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
