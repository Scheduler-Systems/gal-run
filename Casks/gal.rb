cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.310"
  sha256 arm:    "18a5187fc4b529d2965b83535c2c4a132df3313d028d8c6eee31d3e1cabdc54d",
         x86_64: "51d82cbc7640083a5f647713017b68a411699a41ad8fbaabadb1e5fd0dfff0a2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.310/gal-#{version}-darwin-#{arch}.tar.gz"
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
