cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.525"
  sha256 arm:    "38f468a3000a05f2c5588032ee6f81925ab929f4ad4b78d6d2b4414011ec290c",
         x86_64: "370bd45e78e56e8edd8a79648e189852580e3c79cc04c5dfc44f95d081c364d6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.525/gal-#{version}-darwin-#{arch}.tar.gz"
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
