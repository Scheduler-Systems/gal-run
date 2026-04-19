cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.604"
  sha256 arm:    "d7427166ce308a8b6aa5248ab770e2b2dbfe53aa6c618c6a69a2f9bcd30c02c4",
         x86_64: "5ad875dc8e9fafcb7017f4eec3f6a4ff78451c66e1203f926b5c8945c4ed04b0"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.604/gal-#{version}-darwin-#{arch}.tar.gz"
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
