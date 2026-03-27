cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.377"
  sha256 arm:    "ef392794944fd54aabd02153e8cf6aabc3b61c677b5e3a19805f538cf87914a8",
         x86_64: "b67c3d5fcf4095d65e5862a68a43fed997f6a4cae5579acd63c2f104e3e86455"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.377/gal-#{version}-darwin-#{arch}.tar.gz"
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
