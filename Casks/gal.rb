cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.315"
  sha256 arm:    "8fe3d2994e307610ed3f7a4ce2b17442b988bcfa27fe4a836be12999040896d4",
         x86_64: "7838317dd01b0390e3301f4377cc49e054c1cd483ab55bee7c6ab0f1f8c69c84"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.315/gal-#{version}-darwin-#{arch}.tar.gz"
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
