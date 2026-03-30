cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.448"
  sha256 arm:    "0b3fa8d7b74c715d33ed718aa4326093c25b198ad9112a27bdbfb03f5cdb0801",
         x86_64: "b5acdd91a7a1b2213989308002b5b72aa6e06976e32939ef9837ee087bcb439a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.448/gal-#{version}-darwin-#{arch}.tar.gz"
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
