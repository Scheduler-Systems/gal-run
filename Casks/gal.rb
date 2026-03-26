cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.355"
  sha256 arm:    "1bfcdf809aaa5f1f1f8fa4be0a2ef0489361d60d233a81f56d8fe2cee4066f15",
         x86_64: "90f4fd57754a8e02b45f43850a3eb92abbd608dd7dc2f3b4c41a84de98e3f54c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.355/gal-#{version}-darwin-#{arch}.tar.gz"
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
