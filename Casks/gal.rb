cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.588"
  sha256 arm:    "4999efe3e950f62d843857c11f685214ed3404b71fc482fd4232f405440fcf79",
         x86_64: "7c08b383c7385cd3749e4f1d23070a0901ea70cf672af4438aeb034016e78a6a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.588/gal-#{version}-darwin-#{arch}.tar.gz"
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
