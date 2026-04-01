cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.523"
  sha256 arm:    "0dfff8954cd911d919cd213ea47ca457b9336f3046509e5383b948f5f6f9fd38",
         x86_64: "ff4a33f1784299a2cd0f5f89c8f9931c472379dc24aafa2300a1665aa1aa6854"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.523/gal-#{version}-darwin-#{arch}.tar.gz"
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
