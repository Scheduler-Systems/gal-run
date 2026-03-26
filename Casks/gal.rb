cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.366"
  sha256 arm:    "e3c7afb6eb0bc721dbd0a9fa43d99dcda6a9676515fe8c5696663364fefb1026",
         x86_64: "0ee53b8605a5631249429adbb80fec728f241da07bae0af2e23caa2628035fab"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.366/gal-#{version}-darwin-#{arch}.tar.gz"
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
