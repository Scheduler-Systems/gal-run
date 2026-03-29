cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.406"
  sha256 arm:    "b7ff831ff3c6a509f704dc510053c01e8370fbd8f46ebbee724a43979a068ab4",
         x86_64: "a830716cd1081d618d6f1bed066157d7bf0e29532dfe443e97c0fc7ed0059e8e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.406/gal-#{version}-darwin-#{arch}.tar.gz"
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
