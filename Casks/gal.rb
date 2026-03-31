cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.472"
  sha256 arm:    "4e3c0515f4ce6ff0c4fcd553320511949c749064b4dbb7245ebfa0b78db29899",
         x86_64: "120eba1938e7e053204a0914967de4d946c023975bfbd6d77aaa32b1bf845862"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.472/gal-#{version}-darwin-#{arch}.tar.gz"
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
