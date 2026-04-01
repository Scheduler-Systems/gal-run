cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.505"
  sha256 arm:    "d800c65b67007be9202a59790b51b6513bf351c1d6fe6f59ec7729f90af31e42",
         x86_64: "c35f1052cb6d9bb17c5f50cb30ab499b23c44ac13fd8977b3abf73b26601528a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.505/gal-#{version}-darwin-#{arch}.tar.gz"
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
