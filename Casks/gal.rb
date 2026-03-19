cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.305"
  sha256 arm:    "601a8026c07369865a4424cb7afa46e658b8ab5c7f1b1b1fa774a6994042a281",
         x86_64: "7435445ff6a2cfc9d8a6b4c6d14c9afa7b3dcd5f0a5ba1b76408725a5da4fe9a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.305/gal-#{version}-darwin-#{arch}.tar.gz"
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
