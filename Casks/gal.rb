cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.365"
  sha256 arm:    "0a9098300168fff2ada85140252f6a2bf5e0dc2a93bbffd7ffc713dfa6140963",
         x86_64: "951062fc7e8346c94f7cf344b1b926f95b08a5c9c3a43eecd3de3d28b734366b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.365/gal-#{version}-darwin-#{arch}.tar.gz"
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
